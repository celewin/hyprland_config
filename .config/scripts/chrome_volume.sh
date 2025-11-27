#!/bin/bash

VOLUME1=$1
VOLUME2=$2
STATE_FILE="/tmp/chrome_volume_state"

# Prüfe ob beide Argumente übergeben wurden
if [ -z "$VOLUME1" ] || [ -z "$VOLUME2" ]; then
    echo "Verwendung: $0 <volume1> <volume2>"
    echo "Beispiel: $0 20% 100%"
    exit 1
fi

# Finde Chrome Sink Input
SINK_INPUT=$(pactl list sink-inputs | grep -B 20 'application.name = "Google Chrome"' | grep "Sink Input #" | grep -oP "[0-9]+")

if [ -z "$SINK_INPUT" ]; then
    echo "Google Chrome Audio-Stream nicht gefunden"
    exit 1
fi

# Lese aktuellen State (default: 0 = VOLUME1)
if [ -f "$STATE_FILE" ]; then
    CURRENT_STATE=$(cat "$STATE_FILE")
else
    CURRENT_STATE=0
fi

# Toggle zwischen den beiden Werten
if [ "$CURRENT_STATE" -eq 0 ]; then
    pactl set-sink-input-volume "$SINK_INPUT" "$VOLUME2"
    echo 1 > "$STATE_FILE"
    echo "Lautstärke auf $VOLUME2 gesetzt"
else
    pactl set-sink-input-volume "$SINK_INPUT" "$VOLUME1"
    echo 0 > "$STATE_FILE"
    echo "Lautstärke auf $VOLUME1 gesetzt"
fi