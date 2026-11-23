# BegehungsProfi – offlinefähige Kernversion

Mobile Web-App zur Erfassung sicherheitstechnischer Begehungen, lokalen Speicherung (IndexedDB), Maßnahmenverfolgung und Word-Export ohne Fremdbibliotheken.

## Starten

Die App **muss** über HTTP(S) bereitgestellt werden (nicht per Doppelklick auf die HTML-Datei). Auf dem eigenen Computer im Projektordner z. B.:

```bash
python3 -m http.server 8080
```

Danach `http://localhost:8080` öffnen. Der Dienst ist dann nur auf dem jeweiligen Rechner nutzbar; für das Smartphone braucht es einen HTTPS-Webhost oder einen lokalen HTTPS-Server mit einem für das Smartphone vertrauenswürdigen Zertifikat. Auf iPhone: Safari → Teilen → Zum Home-Bildschirm. Auf Android: Chrome → Menü → App installieren / Zum Startbildschirm hinzufügen. Für die erste Installation online öffnen, danach sind die gecachten Dateien offline verfügbar.

## Funktionen

- Beliebig viele Begehungen und nummernstabile Mängel
- Drei komprimierte JPEG-Fotos pro Mangel, Kamera-/Galerie-Eingabe, Vorschau und Bildunterschriften
- Autosave auf IndexedDB; spätere Bearbeitung
- Dringlichkeit, Frist als Datum oder Text, Erfassungsdatum, Bearbeitungsstatus
- Nachbegehungen mit protokolliertem Statusverlauf und Behebungsdatum
- Berichtsbearbeitung und strukturierte HTML-Vorschau
- Echter DOCX-Export mit editierbaren Texten und Tabellen, Fotos, Deckblatt, Inhaltsverzeichnis-Feld, Kopf-/Fußzeile und Seitenfeld
- Datensicherung als JSON einschließlich Fotos und Wiederherstellung
- Optionaler, konfigurierbarer OpenAI-kompatibler API-Endpunkt zur überprüfbaren KI-Textoptimierung

## Änderung in Version 2

- Fehler behoben: Die Texte im Mangel-Editor werden jetzt dem jeweiligen Mangel statt fälschlich der Begehung zugeordnet und unmittelbar in IndexedDB gespeichert.
- Word-Abschnitt 4: Mängeldaten in tabellarischer Anordnung, bis zu drei Fotos nebeneinander.
- Word-Abschnitte 5, 6 und 7 entfernt; die Nachprüfungen einzelner Mängel bleiben bei Abschnitt 4.
- Nach dem Hochladen auf GitHub Pages die Seite neu laden, damit die aktualisierte PWA-Datei verwendet wird.
- WICHTIG: Bereits früher nicht korrekt gespeicherte Texte lassen sich durch dieses Update nicht rückwirkend wiederherstellen.

## Einschränkungen und Sicherheit

- Diese Version verwendet bewusst **Vanilla JavaScript statt React/TypeScript**; sie benötigt damit weder Build-Prozess noch verpflichtende CDN-/Cloud-Abhängigkeiten.
- Die KI ist **nur nach Konfiguration eines tatsächlich erreichbaren API-Endpunkts** nutzbar. Eine unmittelbare Browser-Anbindung erfordert CORS-Freigabe; Schlüssel sind im Client sichtbar. Nutzen Sie einen eigenen Proxy für produktive Nutzung. Der API-Schlüssel wird nicht dauerhaft gespeichert.
- Datenspeicherung ist geräte- und browsergebunden. Vor Gerätewechsel, Browserbereinigung oder wichtigen Begehungen JSON-Sicherung anlegen. Keine serverseitige Synchronisierung, keine Verschlüsselung auf Anwendungsebene.
- Die Vorschau bildet den Dokumentaufbau ab, nicht die exakte Word-Paginierung. Das Inhaltsverzeichnis muss in Word aktualisiert werden. Die Fotos werden im Word-Bericht nach Möglichkeit in einer Dreierspalte nebeneinander dargestellt.
- Die fachliche Gesamtbeurteilung wird **nicht automatisch erfunden**; sie muss von der verantwortlichen qualifizierten Person selbst geprüft und vervollständigt werden. Das Produkt enthält keine automatisch zugewiesenen Rechtsnormen.
- Noch keine instrumentierten Browser-/Geräte-/Lasttests (insbesondere 50/100 Mängel) oder reale Microsoft-Word-Kompatibilitätsprüfung durchgeführt. Vor professionellem Einsatz zuerst mit Testdaten und anschließend in Word validieren.
