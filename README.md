# iOS3
# Applikationsentwicklung unter iOS (WS2017/18) 3. Übung
Swift Collections, Archivierung von Daten
In dieser Übung entwerfen Sie einige Klassen zum Verwalten eines Adressbuchs. Die Applikation wird in dieser Aufgabe auf der Konsole unter OS X laufen. Designen Sie die Klassen bitte so, dass Sie sie wiederverwenden können. Später werden wir dem Adressbuch ein GUI auf dem iPhone geben.


Bitte beachten Sie die Abgabehinweise.

Hinweis: Im Laufe der Arbeiten legen Sie die Klassen AddressCard und AddressBook an. Diese Klassen wollen wir später wiederverwenden. Achten Sie darauf, dass diese Klassen keinen Konsolen-I/O enthalten. Sämtliche Programmlogik wird in main.swift implementiert, wo auch das Konsolen-I/O stattfindet.
Erstellen Sie mit Xcode ein neues Command Line Tool Projekt mit dem Namen iOS3-<Nachname(n)> (z.B. iOS3-Lemke oder iOS3-Lemke-Schmidt).
File -> New -> Project... -> macOS -> Command Line Tool -> Next -> Projektname eintragen und darauf achten, dass Language = Swift ist. 
 
Entscheiden Sie sich, wie die Sie das Adressbuch später archivieren wollen. Auswahlmöglichkeiten:
Property List (neues Format von Swift 4, 05-Foundation-Archivierung.pptx.pdf ab Folie 13)
JSON (neues Format von Swift 4, 05-Foundation-Archivierung.pptx.pdf ab Folie 13)
Property List traditionell mit NSKeyedArchiver (05-Foundation-Archivierung.pptx.pdf ab Folie 22)
 
Wer sich nicht entscheiden kann nehme Option 1.
 
Fügen Sie dem Projekt eine Klasse AddressCard mit folgenden Properties hinzu:
Vorname
Nachname
Straße (inklusive Hausnummer)
Postleitzahl (als Int)
Ort
Eine Liste der Hobbys (als Array das später Strings aufnimmt).
Eine Liste der Freunde (als Array das später AddressCards aufnimmt).
  
Ergänzen Sie AddressCard um folgende Methoden / Eigenschaften:
Falls Sie Property List oder JSON aus Swift 4 verwenden:
Unterstützen Sie das Protokoll Codable.
Unterstützen Sie das Protokoll Equatable. Dazu müssen Sie den Operator == implementieren, z.B. indem Sie Vor- und Nachnamen vergleichen. Siehe 03-Swift_T3.pptx.pdf Folie 46.
Falls Sie NSKeyedArchiver verwenden:
Leiten Sie die Klasse AddressCard von NSObject ab und überschreiben Sie den von NSObject geerbten Initializer init(). Rufen Sie darin lediglich init() der Superklasse auf.
Unterstützen Sie das Protokoll NSCoding. Implementieren Sie die dazu benötigten Methoden.
ACHTUNG beim Implementieren von init(coder decoder: NSCoder): Verwenden Sie decoder.decodeInteger(forKey:) für Int und decoder.decodeObject(forKey:) für alles andere (String und Arrays).
Hinzufügen eines Hobbys:
func add(hobby: String)
Entfernen eines Hobbys (verwenden Sie die Methode index(of:), um in einem Array den Index des gesuchten Objekts zu finden)
func remove(hobby: String)
Hinzufügen eines/einer Freundes/in
func add(friend: AddressCard)
Entfernen eines/einer Freundes/in (verwenden Sie wiederum die Funktion Methode index(of:))
func remove(friend: AddressCard)
  
Fügen Sie dem Projekt eine Klasse AddressBook hinzu:
Falls Sie Property List oder JSON aus Swift 4 verwenden:
Unterstützen Sie das Protokoll Codable.
Falls Sie NSKeyedArchiver verwenden:
Leiten Sie die Klasse AddressBook von NSObject ab und überschreiben Sie den von NSObject geerbten Initializer init(). Rufen Sie darin lediglich init() der Superklasse auf.
Unterstützen Sie das Protokoll NSCoding. Implementieren Sie die dazu benötigten Methoden.
Fügen Sie folgende Property hinzu:
Eine Liste von Adresskarten (als Array)
  
Ergänzen Sie AddressBook um folgende Methoden:
Hinzufügen einer Adresskarte:
func add(card: AddressCard)
Entfernen einer Adresskarte:
func remove(card: AddressCard)
Achten Sie darauf, dass mit der Karte auch alle Freundes-Referenzen auf diese Karte entfernt werden!
Sortieren des Adressbuchs nach Nachnamen.
Suchen einer Karte nach dem Nachnamen.
Beachten Sie, dass die Suche auch kein Ergebnis haben kann, falls jemand mit dem gesuchten Namen nicht existiert. Von welchem Typ muss der Rückgabewert Ihrer Suchmethode sein?
Archivieren des Adressbuchs in eine Datei:
func save(toFile path: String)
Factory-Methode zum Erzeugen eines Adressbuchs aus einer Datei:
class func addressBook(fromFile path: String) -> AddressBook?
  
Implementieren Sie in main.swift folgende Funktionalitäten:
Einlesen des Adressbuchs aus der Datei zum Programmstart. Benutzen Sie als Dateinamen "book.plist" bzw. "book.json".
Sollte das Einlesen fehlschlagen (z.B. weil die Datei noch nicht existiert), so legen Sie ein leeres Adressbuch an.
Eingeben einer neuen Adresskarte inklusive Hobbys aber noch ohne Freunde. Das Adressbuch soll nach der Eingabe automatisch sortiert werden.
Auflisten aller Karten des Adressbuchs.
Eine Karte durch Angabe eines Nachnamens finden. Für eine gefundene Karte sollen folgende Aktionen möglich sein:
Die Karte aus dem Adressbuch löschen.
Der Karte eine(n) Freund/in hinzufügen. Dazu muss dieser/diese wiederum über seinen/ihren Nachnamen im Adressbuch gesucht werden.
Abspeichern des Adressbuchs in eine Datei vor dem Programmende. Verwenden Sie als Dateinamen wieder "book.plist" bzw. "book.json".

Tipp: Solange Sie noch nicht das Abspeichern und Einlesen Ihres Adressbuchs implementiert haben, müssten Sie für jeden Testlauf immer wieder ein oder mehrere Adresskarten von Hand eingeben. Das verbraucht zu viel Zeit. Implementieren Sie daher eine Hilfsfunktion, die ein leeres Adressbuch mit ein paar fest vorgegebenen Adresskarten füllt. Sobald das Archivieren funktioniert, können Sie den Aufruf dieser Hilfsfunktion auskommentieren. Bewahren Sie die Hilfsfunktion für eine spätere Übungsaufgabe auf.

Tipp: Implementieren Sie in main.swift eine Hilfsfunktion, mit der Sie eine Eingabeaufforderung auf die Konsole ausgeben und dann anschließend einen Antwortstring einlesen. Diese könnten Sie dann wie folgt benutzen:
let name = read(withPrompt: "Bitte geben Sie einen Namen ein.") 


Eine typische Sequenz auf der Kommandozeile könnte so aussehen:

(E)ingabe, (S)uche, (L)iste oder (Q)uit? e
Neue Karte anlegen:
Vorname: Robert
Nachname: Lemke
Straße: Dorfweg 12
Postleitzahl: 12345
Ort: Berlin
Hobby: (Abbruch mit (Q)) Reiten
Hobby: (Abbruch mit (Q)) Tanzen
Hobby: (Abbruch mit (Q)) q

(E)ingabe, (S)uche, (L)iste oder (Q)uit? e
Neue Karte anlegen:
Vorname: Hans
Nachname: Buch
Straße: Hauptstr. 4
Postleitzahl: 20462
Ort: Hamburg
Hobby: (Abbruch mit (Q)) Schwimmen
Hobby: (Abbruch mit (Q)) q

(E)ingabe, (S)uche, (L)iste oder (Q)uit? l
+-----------------------------------
| Hans Buch
| Hauptstr. 4
| 20462 Hamburg
| Hobbys:
|   Schwimmen
| Freunde:
+-----------------------------------
+-----------------------------------
| Robert Lemke
| Dorfweg 12
| 12345 Berlin
| Hobbys:
|   Reiten
|   Tanzen
| Freunde:
+-----------------------------------

(E)ingabe, (S)uche, (L)iste oder (Q)uit? s
Suchname: Lemke
+-----------------------------------
| Robert Lemke
| Dorfweg 12
| 12345 Berlin
| Hobbys:
|   Reiten
|   Tanzen
| Freunde:
+-----------------------------------
(F)reund/in hinzufügen, (L)öschen oder (Z)urück? f
Name Freund/in: Buch
'Hans Buch' hinzugefügt.
(F)reund/in hinzufügen, (L)öschen oder (Z)urück? z

(E)ingabe, (S)uche, (L)iste oder (Q)uit? l
+-----------------------------------
| Hans Buch
| Hauptstr. 4
| 20462 Hamburg
| Hobbys:
|   Schwimmen
| Freunde:
+-----------------------------------
+-----------------------------------
| Robert Lemke
| Dorfweg 12
| 12345 Berlin
| Hobbys:
|   Reiten
|   Tanzen
| Freunde:
|   Hans Buch, 20462 Hamburg
+-----------------------------------

(E)ingabe, (S)uche, (L)iste oder (Q)uit? q


