#!/bin/bash
source "/Users/yaya/00files/local/en-vars"

# <xbar.title>CPU Usage</xbar.title>
# <xbar.version>1.0</xbar.version>
# <xbar.refresh>10s</xbar.refresh>

# Fetch data from the Home Assistant API
wthr=$(curl -s -H "Authorization: Bearer ${HASST}" -H "Content-Type: application/json" https://hass.${LOCALDOMAIN}/api/states/weather.forecast_home)

temp=$(curl -s -H "Authorization: Bearer ${HASST}" -H "Content-Type: application/json" https://hass.${LOCALDOMAIN}/api/states/sensor.aqara_sensor_bedroom_temperature)

humi=$(curl -s -H "Authorization: Bearer ${HASST}" -H "Content-Type: application/json" https://hass.${LOCALDOMAIN}/api/states/sensor.aqara_sensor_bedroom_humidity)


# If the API request failed, print an error
if [ -z "$temp" ]; then
    echo "Error: Failed to fetch data"
    exit 1
fi

# Extract the "state" value from the JSON response
output1=$(echo "$wthr" | grep -o '"temperature":[0-9\.]*' | head -1 | cut -d':' -f2)
output2=$(echo "$temp" | awk -F'"state":"' '{print $2}' | awk -F'"' '{print $1}')
output3=$(echo "$humi" | awk -F'"state":"' '{print $2}' | awk -F'"' '{print $1}')

# Print the output to xbar
final="$(echo "w $output1" | awk -F. '{print $1}') $(echo "t $output2" | awk -F. '{print $1}') $(echo "h $output3" | awk -F. '{print $1}')"

echo "$final"

