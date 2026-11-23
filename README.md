# BegehungsProfi Version 3 – Offline-App mit optionaler Cloud-Synchronisierung

Installierbare, responsive PWA fuer sicherheitstechnische Begehungen, Maengelverwaltung und echte editierbare Word-Berichte.

**Neu in Version 3:** Freiwillige Synchronisierung zwischen Android und PC ueber private Supabase-Datenbank und privaten Foto-Bucket; Passwort-Anmeldung; Offline-Puffer; Konfliktkopien bei konkurrierenden Aenderungen. `sync.js` enthaelt den Client. `SUPABASE-EINRICHTUNG.sql` enthaelt Schema und Schutzregeln. `INSTALLATION-FUER-ANFAENGER.md` erklaert alle Schritte.

Alle Version-2-Funktionen bleiben erhalten: lokale IndexedDB-Speicherung, pro Mangel bis zu drei Fotos, Textfelder und Massnahmen, Dringlichkeit, Fristen, Verlauf von Nachbegehungen, bearbeitbarer Word-Export mit tabellarischer Dokumentation und Foto-Dreierreihe, JSON-Datensicherung, optionale KI-Textoptimierung ueber eigenen Dienst.

## Ohne Cloud nutzbar

Die Cloud-Konfiguration ist optional. Ohne Einrichtung bleibt die PWA eine rein lokale Offline-App. Die Synchronisierung kann nicht ohne separate Einrichtung einer Datenbank funktionieren.

## Sicherheit und Grenzen

- Die benutzten Supabase-Schluessel sind **oeffentliche Publishable Keys**, keine Service-Role-Secrets. Der Zugriff auf Dokumente ist durch Supabase Auth + RLS geschuetzt. Der private Storage Bucket ist nur fuer den Besitzer zugaenglich. GitHub-Dateien duerfen niemals Secrets enthalten.
- Kein E2E-Verschluesselungsversprechen, kein vollstaendiger Sicherungs-/Disaster-Recovery-Dienst. Server und Cloudanbieter sind separate Verantwortungsbereiche. Datenschutzrechtliche Pruefung fuer echte Kunden-/Mitarbeiterdaten erforderlich.
- Dateiformate und SQL muessen auf einem echten Supabase-Projekt und Smartphones getestet werden; ein Live-Dienst wurde nicht mit diesem Paket provisioniert. Es bestehen keine verifizierten realen Logins oder Endgeraete-Tests.
- Bei parallelen Aenderungen derselben Begehung wird eine separate Konfliktkopie angelegt, keine automatische Zusammenfuehrung. Cloud-Loeschung ist als Markierung umgesetzt, Fotos bleiben moeglicherweise im Cloud-Speicher.
- Auch im Offline-Modus haengen Daten vom Bestand lokaler Browserdaten ab. Vor Aktualisierungen Sicherung exportieren. Die Aufbewahrung aller Fotos ist von Speicherlimits abhaengig.

## Version 4 – Layout und Aktenzeichen

- Akt-Nr. unter **Begehungsdaten** je Begehung frei eingeben. Die Nummer erscheint auf dem Deckblatt sowie in den Allgemeinen Angaben.
- Optionales Firmenlogo unter **Einstellungen** hochladen; im Word-Deckblatt wird es oben rechts positioniert.
- DOCX-Layout: Arial 12 Punkt, Schriftfarbe Schwarz, Blocksatz, vergrößerte Absatzabstände; keine Inhaltsverzeichnis-Seite.
- Maximal drei Mängelfotos nebeneinander in einer Word-Tabelle. Die bisherigen Funktionen aus Version 3 einschließlich optionaler Cloud-Synchronisierung bleiben erhalten.
- Ausführliche Anleitung: `UPDATE-VERSION-4-ANLEITUNG.md`.
