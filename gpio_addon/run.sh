#!/bin/bash
set -e

# Load options from config.json
PIN=$(jq --raw-output ".pin" /data/options.json)
STATE=$(jq --raw-output ".state" /data/options.json)

# Export GPIO pin
if [ ! -d "/sys/class/gpio/gpio$PIN" ]; then
    echo "$PIN" > /sys/class/gpio/export
fi

echo "out" > /sys/class/gpio/gpio$PIN/direction

# Set pin state
if [ "$STATE" == "on" ]; then
    echo "1" > /sys/class/gpio/gpio$PIN/value
    echo "GPIO $PIN is set to HIGH"
else
    echo "0" > /sys/class/gpio/gpio$PIN/value
    echo "GPIO $PIN is set to LOW"
fi

# Keep the container alive
while true; do
    sleep 10
done
