#!/bin/bash

# Den Befehl ausführen und den Output in eine Variable speichern
output=$(pamixer --list-sources | grep "HyperX Cloud Stinger Core + 7.1 Mono")

# Die Zeile mit der Zahl auswählen
line=$(echo "$output" | awk '{print $1}')

# Die Zahl aus der Zeile extrahieren
source_number=$(echo "$line" | tr -d '"')

# Den Befehl mit der extrahierten Zahl ausführen

pamixer --source "$source_number" -t
pamixer -t