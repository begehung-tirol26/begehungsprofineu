# BegehungsProfi – Version 6 (lokal, mit Kundenverwaltung)

Diese Version baut auf BegehungsProfi Version 5 auf. Die bekannte Mängelerfassung, Maßnahmenverfolgung, Nachbegehung, Fotofunktionen, optionale KI-Textoptimierung und DOCX-Erzeugung bleiben erhalten.

## Änderungen

- **Nur lokal:** Keine Supabase-Anbindung, keine Registrierung und keine automatische Synchronisierung. Daten liegen pro Browser/Gerät in IndexedDB. Ausnahme: die ausdrücklich aufgerufene optionale KI-Textüberarbeitung nutzt den selbst eingestellten externen Dienst.
- **Kundenverwaltung:** Kunden anlegen, bearbeiten, suchen, alphabetisch anzeigen, löschen (nur ohne zugeordnete Begehungen) und Stammangaben für neue Begehungen wiederverwenden. Standorte/Betriebsstätten lassen sich auswählen.
- **Kundenzuordnung:** Jede neue Begehung erfordert einen Kunden. Ein historischer Snapshot seiner Angaben bleibt in der Begehung, auch wenn spätere Stammdaten geändert werden.
- **Migration:** Bestehende Version-5-Begehungen aus derselben Browser-Installation werden nicht gelöscht. Beim ersten Start erstellt Version 6 anhand der bisherigen Firmennamen passende Kundeneinträge. Die vorhandenen Begehungstexte und eingebetteten Fotos bleiben erhalten.
- **Löschen:** Eine einzelne Begehung wird nach zusätzlicher Bestätigung dauerhaft aus der lokalen Datenbank entfernt. Vorher können DOCX und eine lokale Sicherung exportiert werden. Andere Begehungen und Kunden bleiben unberührt.
- **Speicherübersicht:** Geschätzte JSON-/Fotogrößen pro Begehung und Kunde, Gesamtgröße, Anzahl Fotos. Dies ist eine **Schätzung**, keine exakte Messung der physischen Browserbelegung.
- **Backups:** Vollsicherung, einzelne Begehung und einzelne Kunden mit Begehungen – jeweils als JSON inklusive Fotos. Der Import schützt vorhandene Datensatz-IDs vor Überschreiben und importiert zusätzliche Datensätze.
- **Word:** Der bisherige Abschnitt „Zusammenfassung der Mängel“ ist entfernt. Die detaillierte Mängeldokumentation ist nun Kapitel 3. Arial 12, schwarze Tabellenrahmen, Dringlichkeitsfarben und Fotodokumentation bleiben erhalten. Das Inhaltsverzeichnis war bereits in Version 5 entfernt und bleibt entfernt.

## Datenschutz & Speicher

Der JavaScript-Code und die statischen App-Dateien können weiterhin über GitHub Pages veröffentlicht werden; **persönliche Begehungsdaten und Fotos werden dabei nicht automatisch an GitHub übertragen**. Browserdaten verbleiben lokal im jeweiligen Website-Speicher. Bei der ersten Nutzung muss die App-Datei online geladen werden, danach funktioniert die installierte PWA offline. Der browserinterne Speicher kann bei Bereinigung, Deinstallation oder Geräteschaden verloren gehen. Deshalb regelmäßig eine JSON-Sicherung erstellen und sicher separat aufbewahren.

**Keine Handy-PC-Synchronisierung mehr:** Sollen Daten zwischen Geräten übertragen werden, muss eine JSON-Sicherung auf dem Quellgerät erstellt und auf dem Zielgerät bewusst importiert werden. Beide Geräte haben sonst unterschiedliche Datenbestände.

**Frühere Cloud-Daten:** Version 6 deaktiviert die Verbindung, löscht aber nicht automatisch früher eventuell bereits in Supabase gespeicherte Daten. Falls ein Supabase-Projekt bereits genutzt wurde, dort gesondert prüfen und erst nach eigenständiger Sicherung/Datenschutzklärung bereinigen. Die vorherigen lokalen Sync-Konfigurationen und Anmeldetokens werden aus dem Meta-Speicher entfernt.

## Technischer Betrieb

- Statische HTML-/CSS-/JavaScript-App ohne Pflicht-Abonnements
- Datenbank `begehungsprofi-db`, schema upgrade **1 → 2** (Stores: `visits`, `meta`, `customers`)
- Service Worker Cache: `begehungsprofi-v6`
- Komplett offline nach erstmaliger erfolgreicher Bereitstellung/Caching, optionaler KI-Dienst ausgenommen
- Echtes editierbares `.docx` ohne externe Bibliotheken

## Vor dem Update

1. Unbedingt in Version 5 auf dem **gleichen Android-Browser** eine vollständige Datensicherung erstellen und an sicheren Ort kopieren.
2. **Nicht** Browserdaten löschen, Website-Speicher entfernen oder App deinstallieren.
3. Dateien aus dieser ZIP in GitHub-Projekt `begehungsprofineu` aktualisieren (bestehende `index.html`, `app.js`, `style.css`, `sw.js` usw.). `sync.js` und die alte SQL-Datei werden von V6 **nicht** verwendet und sollten nach Bedarf aus dem Repository entfernt werden.
4. Am Handy alle alten App-Fenster schließen und denselben URL im selben Browser neu laden.
5. Auf Startseite Version `V6` sowie Kundenverwaltung prüfen. Alte Daten anschließend auf Vollständigkeit prüfen.
6. Testkunden, Testbegehung, Fotos, Backup, Import und DOCX prüfen, bevor vertrauliche Daten verwendet werden.

Siehe `UPDATE-VERSION-6-ANLEITUNG.md` für eine ausführliche Anfängeranleitung.

## Grenzen und Qualitätsstatus

Geprüft: JavaScript-Syntax, simulierte IndexedDB-Migration mit Erhalt eines historischen Fotos und Mängels, Kundenanlage, Begehungsanlage, Speichern von Texten, Schutz gegen sofortiges Löschen und DOCX-Erzeugung einschließlich Layout-Rendering. Der Testbericht enthielt die Kundenfelder und die detaillierte Mängeldokumentation ohne Zusammenfassung.

Nicht vollständig geprüft: reale Android-Browser-/PWA-Aktualisierung, physische Speicherfreigabe des Geräts, 50/100-Mängel-Belastung, Rückimport umfangreicher Originalfotos, alle Kantenfälle des Migrations- und Löschen-Dialogs sowie Word unter Microsoft Office. Ein vollständig automatisierter Browser-End-to-End-Test war in der Testumgebung nicht möglich. Bitte zunächst mit Testdaten prüfen.
