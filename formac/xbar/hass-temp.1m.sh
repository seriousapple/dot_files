#!/bin/bash
source "/Users/yaya/00files/local/en-vars"

BASE_URL="https://hass.${LOCALDOMAIN}"

call_hass() {
  local endpoint=$1
  curl -s \
    -H "Authorization: Bearer ${HASST}" \
    -H "Content-Type: application/json" \
    "${BASE_URL}${endpoint}"
}

wthr=$(call_hass "/api/states/weather.forecast_home")
temp=$(call_hass "/api/states/sensor.aqara_sensor_bedroom_temperature")
humi=$(call_hass "/api/states/sensor.aqara_sensor_bedroom_humidity")
humiwater=$(call_hass "/api/states/sensor.smartmi_evaporative_humidifer_2_water_level")

# Extract the "state" value from the JSON response
output1="w $(echo "$wthr" | jq -r '.attributes.temperature | floor')"
output2="t $(echo "$temp" | jq -r '.state | split(".")[0]')"
output3="h $(echo "$humi" | jq -r '.state | split(".")[0]')"
output4="wl $(echo "$humiwater" | jq -r '.state | split(".")[0]')"

# Print the output to xbar
final="$(
  echo -n "$output1 "
  echo -n "$output2 "
  echo -n "$output3 "
  echo -n "$output4 "
)"

echo "$final"

