-- BegehungsProfi Version 3: einmalig im Supabase SQL Editor ausfuehren.
-- Nur fuer ein eigenes Projekt. Das Skript erstellt eine private Tabelle und einen privaten Fotobucket.
-- Bestehende Cloud-Begehungen bleiben beim erneuten Ausfuehren erhalten.

create table if not exists public.inspections (
  id text primary key,
  owner_id uuid not null references auth.users(id) on delete cascade,
  payload jsonb not null,
  version integer not null default 1 check (version > 0),
  deleted boolean not null default false,
  updated_at timestamptz not null default now()
);

create index if not exists inspections_owner_idx on public.inspections(owner_id);
alter table public.inspections enable row level security;

-- Rechte nur fuer angemeldete Nutzer; RLS beschraenkt auf eigene Datensaetze.
revoke all on public.inspections from anon;
grant select, insert, update on public.inspections to authenticated;

drop policy if exists "bp_select_own" on public.inspections;
create policy "bp_select_own" on public.inspections
 for select to authenticated using ((select auth.uid()) = owner_id);

drop policy if exists "bp_insert_own" on public.inspections;
create policy "bp_insert_own" on public.inspections
 for insert to authenticated with check ((select auth.uid()) = owner_id);

drop policy if exists "bp_update_own" on public.inspections;
create policy "bp_update_own" on public.inspections
 for update to authenticated using ((select auth.uid()) = owner_id)
 with check ((select auth.uid()) = owner_id);

-- updated_at ist nur ein Hilfswert. Version wird beim bedingten Update atomar erhoeht.
create or replace function public.bp_touch_inspection()
returns trigger language plpgsql set search_path = '' as $$
begin
 new.updated_at = now();
 return new;
end;
$$;
drop trigger if exists bp_touch_inspection_trigger on public.inspections;
create trigger bp_touch_inspection_trigger before update on public.inspections
 for each row execute function public.bp_touch_inspection();

-- Der Bucket darf NICHT oeffentlich gemacht werden.
insert into storage.buckets(id,name,public,file_size_limit,allowed_mime_types)
values ('begehungsprofi-fotos','begehungsprofi-fotos',false,10485760,array['image/jpeg'])
on conflict(id) do update set public=false;

-- Jede Datei liegt unter <Benutzer-ID>/<Begehung-ID>/<Mangel-ID>/<Foto-Hash>.jpg
-- Rechte werden anhand des ersten Pfadbestandteils geprueft.
drop policy if exists "bp_read_own_photos" on storage.objects;
create policy "bp_read_own_photos" on storage.objects
 for select to authenticated using (
  bucket_id='begehungsprofi-fotos'
  and (storage.foldername(name))[1] = (select auth.uid())::text
 );

drop policy if exists "bp_upload_own_photos" on storage.objects;
create policy "bp_upload_own_photos" on storage.objects
 for insert to authenticated with check (
  bucket_id='begehungsprofi-fotos'
  and (storage.foldername(name))[1] = (select auth.uid())::text
 );

drop policy if exists "bp_replace_own_photos" on storage.objects;
create policy "bp_replace_own_photos" on storage.objects
 for update to authenticated using (
  bucket_id='begehungsprofi-fotos'
  and (storage.foldername(name))[1] = (select auth.uid())::text
 ) with check (
  bucket_id='begehungsprofi-fotos'
  and (storage.foldername(name))[1] = (select auth.uid())::text
 );

-- Hinweis: Fotos bleiben bei Loeschen einer Begehung im Bucket, bis sie separat
-- bereinigt werden. Datensicherungen bleiben weiterhin erforderlich.
