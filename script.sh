#!/bin/bash

API_URL="https://valencia.opendatasoft.com/api/explore/v2.1/catalog/datasets/valenbisi-disponibilitat-valenbisi-dsiponibilidad/records?limit=20"
OUTPUT_FILE="data.json"

curl -s $API_URL -o $OUTPUT_FILE
