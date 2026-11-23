# BegehungsProfi Version 5 – Aktualisierung auf GitHub Pages und Android

## 1. ZUERST: Daten sichern

Öffne die bisherige App auf genau dem Android-Handy und im selben Browser wie bisher. Tippe auf **Datensicherung exportieren**. Kontrolliere im Download-Ordner die erstellte JSON-Datei und kopiere sie möglichst auf deinen Windows-PC. Bewahre die Datei auf. Wenn die Sicherung nicht funktioniert, bitte nicht weitermachen. Lösche keine Browser-/Website-Daten und deinstalliere die App nicht.

## 2. Version 5 am Windows-PC entpacken

Rechtsklick auf `BegehungsProfi-PWA-Version-5.zip` → **Alle extrahieren**. Öffne danach den Unterordner `begehungsprofi`. Die Dateien `index.html`, `app.js`, `sync.js`, `style.css`, `sw.js`, `manifest.webmanifest` und `icon.svg` müssen direkt darin liegen.

## 3. In das vorhandene GitHub-Projekt hochladen

1. Öffne in Microsoft Edge https://github.com/begehung-tirol26/begehungsprofineu und melde dich an.
2. Kontrolliere, dass der Projektname **begehungsprofineu** und der Branch **main** angezeigt werden.
3. Klicke **Add file → Upload files**.
4. Öffne den entpackten Ordner auf Windows. Markiere die Dateien darin mit **Strg + A** und ziehe die Dateien (nicht die ZIP-Datei und nicht den Ordner als Unterordner) in das GitHub-Upload-Feld.
5. Prüfe, dass die Dateien in der obersten Projekt-Ebene liegen, genau dort, wo die alte `index.html` liegt.
6. Falls GitHub die vorhandenen Dateinamen akzeptiert, gib als Commit-Beschreibung **BegehungsProfi Version 5 – Word-Layout** ein und klicke **Commit changes**. Falls GitHub eine Fehlermeldung wegen gleicher Dateinamen anzeigt: NICHT das gesamte Repository löschen! Über GitHub-Dateiansicht kann jede geänderte Datei mittels Stiftsymbol (`Edit this file`) geändert werden; bei Problemen den genauen Wortlaut der Meldung prüfen.

## 4. Veröffentlichung kontrollieren

Unter GitHub **Settings → Pages** soll weiterhin **Deploy from a branch**, Branch **main**, Ordner **/(root)** eingestellt sein. Warte, bis der neue Stand veröffentlicht ist. Deine Adresse bleibt:

https://begehung-tirol26.github.io/begehungsprofineu/

## 5. Aktualisierung am Android-Handy

Öffne denselben Browser wie zuvor. Schließe alle BegehungsProfi-Tabs und, falls vorhanden, das gesonderte App-Fenster. Öffne den Link erneut und lade die Seite neu. Die Service-Worker-Version wurde auf `begehungsprofi-v5` angehoben, um die neuen Dateien zu übernehmen. Wenn noch die alte Ausgabe erscheint, die App-Tabs nochmals schließen und nach dem erneuten Öffnen eine Test-Word-Datei erzeugen. **Nicht** Browserdaten oder Website-Speicher löschen; keine Neuinstallation erzwingen.

## 6. Word-Test

Erstelle eine kleine Testbegehung mit Mängeln in den Stufen Leicht, Mittel, Hoch und optional drei Fotos. Exportiere die Word-Datei und öffne sie in Word. Prüfe:

- Nur eine fette Überschrift „SICHERHEITSTECHNISCHER BEGEHUNGSBERICHT“ auf Seite 1, Firmenlogo rechts.
- Kein „Erstellt am ...“ auf dem Deckblatt.
- Titel und Deckblatttabelle beginnen etwas tiefer und passen auf Seite 1.
- Firmenname und Berichtsnummer stehen in der **Fußzeile**, nicht in der Kopfzeile.
- Alle Gitternetzlinien der Tabellen sind schwarz; Spalten und Mangelnummern sind sauber ausgerichtet.
- Dringlichkeit: Hoch rot, Mittel orange, Leicht grün (auch innerhalb der Tabellen).
- Weiterhin Arial 12 Punkt, bearbeitbare Word-Texte und Fotos nebeneinander.

Das Exportdatum ist nicht das Begehungsdatum und wird nun auf Seite 1 nicht mehr ausgegeben.

**Datenschutz:** Die Synchronisierung über Supabase benötigt weiterhin die korrekte Einrichtung und Anmeldung. Die Aktualisierung der GitHub-Seite allein bewirkt keine automatische Gerätesynchronisierung.
