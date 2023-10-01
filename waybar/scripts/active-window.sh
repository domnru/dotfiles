#!/bin/bash

ACTIVE=$(hyprctl activewindow -j)
TITLE=$(echo $ACTIVE | jq -r '.title')

if [[ "$TITLE" == "null" ]] || [[ "$TITLE" == "" ]]; then
    TEXT=" $(whoami)@$(hostname)"
    TOOLTIP="$(uname -s) $(uname -r)"
else
    # Extrahiere den gewünschten Teil aus dem Titel mit sed
    TEXT=$(echo "$TITLE" | sed -E 's/.* - (.*)$/\1/')
    TOOLTIP="class: $(echo $ACTIVE | jq -r '.class')\nxwayland: $(echo $ACTIVE | jq -r '.xwayland')"
fi

JSON=$(echo "{\"text\":\"$(echo $ACTIVE | jq -r '.initialTitle')\", \"tooltip\":\"${TOOLTIP}\"}" | sed 's/&/\&amp;/g')

echo "${JSON}"
