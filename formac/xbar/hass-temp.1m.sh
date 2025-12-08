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
temp_bedroom=$(call_hass "/api/states/sensor.aqara_sensor_bedroom_temperature")
temp_kitchen=$(call_hass "/api/states/sensor.aqara_sensors_kitchen_temperature")
temp_bathroom=$(call_hass "/api/states/sensor.aqara_sensor_bathroom_temperature")
lx=$(call_hass "/api/states/sensor.aqara_lightsensor_bedroom_illuminance")
phone=$(call_hass "/api/states/device_tracker.yaya_iphone")
humi_bedroom=$(call_hass "/api/states/sensor.aqara_sensor_bedroom_humidity")
humi_kitchen=$(call_hass "/api/states/sensor.aqara_sensors_kitchen_humidity")
humi_bathroom=$(call_hass "/api/states/sensor.aqara_sensor_bathroom_humidity")
humiwater=$(call_hass "/api/states/sensor.smartmi_evaporative_humidifer_2_water_level")

wthr="$(echo "$wthr" | jq -r '.attributes.temperature | floor')"
temp_bedroom="$(echo "$temp_bedroom" | jq -r '.state | split(".")[0]')"
temp_kitchen="$(echo "$temp_kitchen" | jq -r '.state | split(".")[0]')"
temp_bathroom="$(echo "$temp_bathroom" | jq -r '.state | split(".")[0]')"
lx="$(echo "$lx" | jq -r '.state | split(".")[0]')"
phone="$(echo "$phone" | jq -r '.state | split(".")[0]')"
humi_bedroom="$(echo "$humi_bedroom" | jq -r '.state | split(".")[0]')"
humi_kitchen="$(echo "$humi_kitchen" | jq -r '.state | split(".")[0]')"
humi_bathroom="$(echo "$humi_bathroom" | jq -r '.state | split(".")[0]')"
humiwater="$(echo "$humiwater" | jq -r '.state | split(".")[0]')"

echo "t $temp_bedroom h $humi_bedroom"
echo "---"
echo "$wthr - outside temp"
echo "br $temp_bedroom kt $temp_kitchen bt $temp_bathroom - temperature"
echo "$lx - light sensor"
echo "$phone - phone status"
echo "br $humi_bedroom kt $humi_kitchen bt $humi_bathroom - humidity"
echo "$humiwater - humi water level"

