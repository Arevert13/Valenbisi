#!/bin/bash

API_URL="https://valencia.opendatasoft.com/api/explore/v2.1/catalog/datasets/valenbisi-disponibilitat-valenbisi-dsiponibilidad/records?limit=20"
OUTPUT_FILE="data.json"
Historico="historico.txt"

curl -s $API_URL -o $OUTPUT_FILE

while true
do
echo "curl -s $API_URL -o $OUTPUT_FILE"

FECHA=$(date '+%Y-%m-%d %H:%M:%S')
cat $OUTPUT_FILE | jq -c '.records[] | .record.fields' | while read -r estacion; do
NOMBRE_ESTACION=$(echo $estacion | jq -r '.address')
BICIS_DISPONIBLES=$(echo $estacion | jq -r '.available')
echo "$FECHA, Estación: $NOMBRE_ESTACION, Bicis Disponibles: $BICIS_DISPONIBLES" >> $Historico
sleep 5
done