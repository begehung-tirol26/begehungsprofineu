# BegehungsProfi Version 4 – Aktualisierung für Anfänger

## Vor dem Hochladen: Daten schützen

1. Auf dem Android-Handy die bisherige App unter https://begehung-tirol26.github.io/begehungsprofineu/ öffnen.
2. Dort **Datensicherung exportieren** wählen. Die heruntergeladene JSON-Datei im Downloads-Ordner kontrollieren.
3. Die JSON-Datei zusätzlich auf den Windows-PC kopieren. Die Datei enthält möglicherweise personenbezogene Daten und Fotos; nicht bei GitHub hochladen.
4. Falls die Cloud-Synchronisierung aktiv ist: vor dem Update warten, bis der Synchronisierungsstatus erfolgreich ist. Trotzdem eine lokale Datensicherung anfertigen.
5. Keine Browserdaten löschen, keine App-Daten löschen und keine Neuinstallation erzwingen. Die Daten werden im Browser dieses Geräts gespeichert.

## Neue Version in das vorhandene GitHub-Projekt hochladen

1. Diese ZIP-Datei auf dem Windows-PC herunterladen und mit Rechtsklick > **Alle extrahieren** entpacken.
2. Den entpackten Ordner `begehungsprofi` öffnen. Darin muss die Datei `index.html` liegen.
3. In Microsoft Edge das bestehende Projekt öffnen: https://github.com/begehung-tirol26/begehungsprofineu
4. Vor dem Ersetzen optional das aktuelle Repository über **Code > Download ZIP** sichern (dies ist nur eine Sicherung der Programmdateien, nicht der Begehungsdaten).
5. Im Repository oberhalb der Dateiliste **Add file > Upload files** öffnen.
6. Die **Dateien aus dem Ordner** `begehungsprofi` markieren und hochladen, nicht den Ordner als zusätzliche Unterebene und nicht die ZIP-Datei.
7. Darauf achten, dass `index.html`, `app.js`, `style.css`, `sync.js`, `sw.js`, `manifest.webmanifest` und `icon.svg` im selben Verzeichnis liegen wie bisher.
8. Unter **Commit changes** die Änderung speichern, z. B. `Version 4 – neues Word-Layout`.
9. Falls GitHub das Überschreiben bestehender Dateien im Upload-Dialog verweigert: **nicht** das komplette Projekt löschen. Stattdessen für jede geänderte Datei im Repository auf den Dateinamen klicken, das Stiftsymbol **Edit this file** wählen und mit dem Inhalt der entsprechenden Datei aus Version 4 ersetzen; dann **Commit changes**. Für größere Dateien oder binäre Bilder ist GitHub Desktop eine weitere Möglichkeit. Im Zweifel Hilfe anfordern, bevor Dateien gelöscht werden.
10. Unter **Settings > Pages** kontrollieren: **Deploy from a branch**, Branch **main**, Ordner **/(root)**. Normalerweise muss daran nichts geändert werden.

## Neue Version auf Android aktivieren

1. Nach erfolgreicher Veröffentlichung (unter GitHub Pages „Visit site“) dieselbe Adresse am Handy öffnen: https://begehung-tirol26.github.io/begehungsprofineu/
2. Im bisher verwendeten Browser bleiben und die Seite einmal neu laden.
3. Falls noch die alte Version erscheint, alle Tabs der App schließen und die Webseite erneut öffnen. Wegen des Offline-Caches kann der neue Stand erst beim nächsten Öffnen sichtbar sein.
4. **Keine Browser-/Websitedaten löschen**, denn das könnte lokale Begehungen und Fotos entfernen.
5. Unter **Begehungsdaten** einer Testbegehung sollte nun das Feld **Akt-Nr.** erscheinen.
6. Unter **Einstellungen** kann ein eigenes Firmenlogo hinzugefügt werden. Im Word-Bericht erscheint dieses oben rechts auf dem Deckblatt.
7. Einen Testbericht exportieren und prüfen: keine Inhaltsverzeichnisse; Arial 12 pt; Schwarz; Blocksatz; Akt-Nr.; Tabellen und nebeneinander angeordnete Fotos.
8. Sicherung aufbewahren. Falls die Synchronisierung noch nicht eingerichtet wurde, teilen Handy und PC ihre Begehungen weiterhin **nicht automatisch**.

## Was wurde geändert?

- Firmenlogo oben rechts auf der ersten Word-Seite (Logo kann unter Einstellungen hochgeladen werden).
- Neues editierbares Feld **Akt-Nr.** bei jeder Begehung, auch im Deckblatt und unter „Allgemeine Angaben“.
- Kein automatisches Inhaltsverzeichnis mehr.
- Gesamter Word-Bericht in Arial, 12 Punkt, Schwarz; Absätze im Blocksatz.
- Zusätzlicher Abstand zwischen Abschnitten und zwischen den dokumentierten Mängeln.
- Tabellarische detaillierte Mängeldokumentation; maximal drei Fotos nebeneinander.
- Die Cloud-Synchronisierung aus Version 3 bleibt im Programm; sie funktioniert nur nach abgeschlossener privater Supabase-Einrichtung.

## Sicherheit

Verwenden Sie vor dem Praxiseinsatz Testdaten. Prüfen Sie die Word-Berichte fachlich und kontrollieren Sie den Import und Export von Datensicherungen auf den genutzten Geräten. Vertrauliche Begehungsfotos, Kundenlisten und JSON-Sicherungen gehören nicht in ein öffentliches GitHub-Repository.
