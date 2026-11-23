# BegehungsProfi Version 3 – Anleitung fuer Windows-PC und Android

**Wichtig vor dem Update:** Ihre bisherige App auf dem Handy oeffnen, `Datensicherung exportieren` waehlen und die heruntergeladene JSON-Datei sicher auf dem PC ablegen. Wichtige Mangeltexte auf dem Handy kontrollieren: Was in der alten Version nie gespeichert wurde, kann auch die neue Version nicht wiederherstellen. Loeschen Sie keine Browserdaten.

## A. App-Version 3 bei GitHub hochladen (Windows)

1. Laden Sie das ZIP-Archiv `BegehungsProfi-PWA-Version-3.zip` herunter. Im Windows-Datei-Explorer rechtsklicken -> **Alle extrahieren**.
2. Im entpackten Ordner `begehungsprofi` liegen die Dateien `index.html`, `app.js`, `sync.js`, `style.css`, `sw.js`, `manifest.webmanifest`, `icon.svg`, `README.md` und zwei Anleitungsdateien. **Keine Zugangsdaten in diese Dateien eintragen!**
3. Im Browser das bestehende Projekt https://github.com/begehung-tirol26/begehungsprofineu oeffnen und anmelden.
4. **Add file -> Upload files** waehlen. Alle Dateien aus dem entpackten Ordner markieren (Strg+A) und auf die Upload-Seite ziehen. **Nicht die ZIP-Datei** hochladen. Falls GitHub einzelne gleichnamige Dateien nicht ersetzen laesst, nicht das Repository loeschen, sondern die betroffene Datei ueber GitHubs Bearbeiten-Funktion aktualisieren.
5. Mit **Commit changes** bestaetigen (auf dem Branch `main`). Wenn GitHub ein Pull Request verlangt, erst die Aenderungen uebernehmen. Danach unter **Settings -> Pages** die bekannte Einstellung `Deploy from a branch`, `main`, `/(root)` beibehalten.
6. Vorhandene App-Adresse oeffnen: https://begehung-tirol26.github.io/begehungsprofineu/ . Auf beiden Geraeten nach erfolgreicher Veroeffentlichung die Seite neu laden. Nicht den Browser-Cache und die Website-Daten loeschen: Dort liegen Ihre lokalen Begehungen.

## B. Gemeinsame, private Cloud-Datenbank einmalig einrichten (Windows)

Die Synchronisierung benoetigt neben GitHub Pages einen Cloud-Dienst. Dieses Paket verwendet **Supabase**. Ein kostenloser Tarif kann fuer den Einstieg ausreichen; Limits und Bedingungen gelten und koennen sich aendern. Es gibt hier **keine bereits eingerichtete Datenbank** und kein fertiges Benutzerkonto.

1. Oeffnen Sie https://supabase.com/dashboard und registrieren Sie sich oder melden Sie sich an.
2. Waehlen Sie **New project** (neues Projekt). Geben Sie einen Projektnamen ein, waehlen Sie ein sicheres Datenbankpasswort und eine passende Region, vorzugsweise eine EU-Region. Das Datenbankpasswort bleibt geheim.
3. Oeffnen Sie links den **SQL Editor** und waehlen Sie **New query**.
4. Oeffnen Sie auf Ihrem PC die mitgelieferte Datei `SUPABASE-EINRICHTUNG.sql` mit dem Editor (Notepad). Markieren Sie alles (Strg+A), kopieren Sie den Inhalt (Strg+C), fuegen Sie ihn im SQL Editor ein (Strg+V) und klicken Sie **Run**.
5. Das Skript legt eine Tabelle mit **Row Level Security** (Datensaetze nur fuer ihren Besitzer) und einen **privaten** Foto-Speicher an. Die Fotos duerfen nicht auf `Public` umgestellt werden.
6. Im Supabase-Projekt finden Sie unter **Project Settings -> API Keys** (oder **Connect / API Keys**) die **Project URL** und den **Publishable Key** (`sb_publishable_...`). Bei aelteren Projekten ist auch `anon public` moeglich. **NIE** den `service_role`- oder `secret`-Schluessel verwenden.
7. Oeffnen Sie Ihre BegehungsProfi-App auf dem PC und klicken Sie oben auf **Cloud / Nicht eingerichtet** (oder auf der Startseite auf **Handy ↔ PC synchronisieren**).
8. Tragen Sie dort die **Project URL** und den **Publishable Key** ein und klicken Sie **Verbindungseinstellungen speichern**. Diese Werte dienen als oeffentliche Projektkennung, nicht als geheimes Passwort.
9. Tragen Sie darunter eine E-Mail-Adresse und ein neues Passwort fuer Ihr **BegehungsProfi-Cloud-Konto** ein. Klicken Sie **Neues Konto registrieren**. Falls Supabase eine Bestatigungs-E-Mail sendet, bestaetigen Sie diese, dann klicken Sie **Anmelden**.
10. Tippen Sie auf **Jetzt synchronisieren**. Sind auf Ihrem PC bereits Begehungen vorhanden, werden sie hochgeladen. Wenn am PC noch keine Begehungen sind, wird zuerst noch nichts angezeigt.

## C. Auf dem Android-Handy synchronisieren

1. Oeffnen Sie denselben GitHub-Pages-Link wie bisher **im selben Browser**; so bleiben Ihre bisherigen lokalen Daten erhalten.
2. Oeffnen Sie **Cloud / Nicht eingerichtet**.
3. Geben Sie **dieselbe Project URL und denselben Publishable Key** ein wie am PC. **Verbindungseinstellungen speichern**.
4. Tragen Sie **dieselbe E-Mail-Adresse und dasselbe Passwort** wie am PC ein und tippen Sie **Anmelden**. **Nicht erneut registrieren!**
5. Tippen Sie auf **Jetzt synchronisieren**. Die bestehenden Handy-Begehungen samt Fotos werden hochgeladen.
6. Wechseln Sie zum PC und klicken Sie dort ebenfalls **Jetzt synchronisieren**. Ihre Begehungen und Fotos sollten angezeigt werden.
7. Probe: Neue TEST-Begehung am Handy anlegen, Text eingeben, speichern, PC aktualisieren und kontrollieren. Danach ein Testfoto hinzufuegen und den Word-Export am PC pruefen.

## D. Taegliche Verwendung

- **Mit Internet:** Daten werden nach Aenderungen automatisch nach einigen Sekunden uebertragen. Auf dem anderen Geraet beim Oeffnen oder ueber **Jetzt synchronisieren** laden.
- **Ohne Internet:** Weiterarbeiten. Die Daten liegen lokal in IndexedDB. Wenn die Internetverbindung zurueckkommt, werden ausstehende Daten uebertragen; der Erfolg ist am Cloud-Status erkennbar.
- **Gleichzeitiges Bearbeiten derselben Begehung:** Die App legt bei Versionskonflikten eine separate **KONFLIKTKOPIE** an, statt still zu ueberschreiben. Vergleichen Sie die zwei Begehungen selbst und uebernehmen Sie die richtigen Angaben. Automatisches feldweises Zusammenfuehren gibt es noch nicht.
- **Fotos:** Die privaten Fotos werden separat in Supabase Storage gespeichert. Die App laedt sie wieder aufs Geraet herunter. Je nach Fotoanzahl kann das einige Zeit und mobiles Datenvolumen beanspruchen.
- **Word:** Weiterhin mit **Word exportieren**; Texte, Tabellen und Fotos werden aus den lokal sichtbaren Begehungen erstellt.

## E. Wichtige Sicherheitshinweise

- GitHub Pages hostet **nur den App-Code**, nicht Ihre Begehungsdaten. Der Code ist oeffentlich. **Keine Passwoerter, Fotos, Sicherungsdateien oder secret keys in GitHub hochladen.**
- Die Cloud nutzt Anmeldung, HTTPS sowie private Datenbank- und Fotozugriffsregeln. Die Daten sind **nicht Ende-zu-Ende-verschluesselt**. Der Cloud-Anbieter hat technische Zugriffsmöglichkeiten nach seinen Regeln; vor Einsatz mit vertraulichen Betriebsdaten Datenschutz, Auftragsverarbeitung, Region und Berechtigungen klaeren.
- Supabase speichert Auth-Sitzungsdaten und die App lokal; deshalb auf gemeinsam genutzten Computern nach Gebrauch abmelden.
- Lokale und Cloud-Speicherung sind **kein Ersatz fuer Datensicherungen**. Regelmaessig `Datensicherung exportieren` ausfuehren; keine Browserdaten loeschen.
- Gelöschte Begehungen werden ausgeblendet. Alte Fotos koennen bis zur separaten Bereinigung im Cloud-Speicher verbleiben.
- Bei einer bestehenden, aktuell geoeffneten Begehung kann ein Update vom anderen Geraet erst sichtbar werden, wenn Sie zur Uebersicht wechseln und erneut synchronisieren.
- Dies ist eine technisch implementierte Version, aber die echte Anmeldung, Synchronisierung und der Schutz gegen Zugriff Dritter sind **ohne ein Supabase-Testprojekt und Endgeraete nicht vollstaendig end-to-end geprueft**. Vor echtem Einsatz zuerst Tests und ggf. eine unabhaengige Sicherheitspruefung durchfuehren.
