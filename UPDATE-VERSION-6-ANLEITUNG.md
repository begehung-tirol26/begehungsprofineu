# BegehungsProfi Version 6 – Einfache Aktualisierung (Windows + Android)

## A. Zuerst Daten sichern – ganz wichtig

1. BegehungsProfi Version 5 **auf dem Android-Handy im bisherigen Browser** öffnen.
2. Auf der Startseite **Datensicherung exportieren** wählen.
3. Die heruntergeladene `.json`-Datei im Ordner „Downloads“ kontrollieren (nicht 0 KB).
4. Eine Kopie außerhalb des Handys speichern, z. B. auf einem betrieblich freigegebenen Windows-PC.
5. **Keine Browserdaten löschen und die alte App nicht deinstallieren.**

## B. Neue Programmdateien bei GitHub hochladen

1. Am Windows-PC die ZIP-Datei **BegehungsProfi-PWA-Version-6.zip** herunterladen und mit „Alle extrahieren“ entpacken.
2. Den Unterordner `begehungsprofi` öffnen. Er enthält u. a. `index.html`, `app.js`, `style.css`, `sw.js`, `manifest.webmanifest` und `icon.svg`.
3. GitHub in Microsoft Edge öffnen: `https://github.com/begehung-tirol26/begehungsprofineu`
4. Im bestehenden Repository bleiben; **kein neues Projekt anlegen**.
5. `Add file` → `Upload files` wählen. Alle Dateien **aus dem entpackten Ordner** auswählen (nicht den Ordner oder die ZIP selbst).
6. GitHub kann vorhandene Dateinamen ersetzen. Sollte GitHub das Ablegen identischer Namen verweigern, keine alten Dateien blind löschen. Dateien einzeln mit dem GitHub-Dateieditor ersetzen oder die IT um Unterstützung bitten.
7. Änderung beispielsweise als `BegehungsProfi Version 6 – lokale Kundenverwaltung` mit `Commit changes` speichern.
8. Optional die alte, nicht mehr verwendete `sync.js` und `SUPABASE-EINRICHTUNG.sql` aus dem GitHub-Repository entfernen. Diese werden von der neuen `index.html` nicht mehr geladen.
9. `Settings` → `Pages` prüfen, ob die Veröffentlichung abgeschlossen ist.

## C. Auf Android umstellen

1. Internet am Handy einschalten.
2. Alle geöffneten BegehungsProfi-Tabs und ggf. das App-Fenster schließen.
3. **Im selben Browser wie vorher** die unveränderte Adresse öffnen:
   `https://begehung-tirol26.github.io/begehungsprofineu/`
4. Die Seite neu laden. Das neue Kopfzeilen-Kürzel `V6` und die Schaltfläche `Kunden` bestätigen das Update.
5. Unter **Kundenverwaltung** prüfen, ob bestehende Firmen aus Version 5 angelegt wurden. Ein Kunde kann mehrere Begehungen haben; die älteren Mängeltexte/Fotos bleiben bei den Begehungen.
6. Kontrollieren, dass ältere Begehungen und Fotos vollständig vorhanden sind.

## D. Neue Begehung

1. `Neue Begehung` wählen.
2. Einen vorhandenen Kunden auswählen oder einen Kunden neu anlegen.
3. Falls gewünscht, eine zusätzliche Betriebsstätte auswählen.
4. Nur die neuen begehungsspezifischen Angaben erfassen. Mängel, Fotoaufnahme, Maßnahmen und Word-Export funktionieren wie bisher.
5. Der Word-Bericht enthält **kein Kapitel Zusammenfassung** mehr; die detaillierte Mängeldokumentation ist Kapitel 3.

## E. Sicherung / Wiederherstellung

- **Gesamtsicherung:** Startseite → `Datensicherung exportieren`.
- **Einzelbegehung:** gespeicherte Begehung → `Sichern` oder Kundenübersicht → `Sichern`.
- **Kundensicherung:** Kundenübersicht → `Kundenbestand sichern`.
- **Import:** Startseite oder Einstellungen → `Datensicherung importieren`.
- Importiert werden neue Datensatz-IDs. Bereits vorhandene Datensätze werden nicht überschrieben.
- Zum Übertragen zum PC: Handy-Backup kopieren und dort importieren. **Keine automatische Synchronisierung** mehr.

## F. Begehung löschen

1. Bei einer Begehung `Löschen` wählen.
2. Der Dialog bietet vorher einen Word-Export oder eine lokale JSON-Sicherung an.
3. Nur wenn wirklich erwünscht `Endgültig löschen` und die Bestätigung wählen. Die Begehung samt enthaltenen Fotos wird dann physisch aus IndexedDB entfernt. Andere Begehungen und Kunden bleiben erhalten.

## G. Sicherheitshinweise

- Die App nutzt lokale Browserdaten, keine Supabase-Cloud und keine automatische Serverübertragung.
- Frühere Supabase-Daten werden durch dieses Update **nicht** automatisch entfernt. Das alte Cloud-Projekt gegebenenfalls getrennt und kontrolliert bereinigen.
- Ohne aktuelle Datensicherung kann Datenverlust durch Geräteverlust, Browser-Bereinigung oder App-Deinstallation entstehen.
- Optionale KI-Textbearbeitung benötigt weiterhin einen selbst konfigurierten Online-Dienst. Nur bewusst ausgewählte Texte werden dann an ihn gesendet.
- Nutze zuerst Testbegehungen, bevor du die neue Version produktiv einsetzt.
