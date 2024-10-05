#!/bin/bash

API_URL="https://valencia.opendatasoft.com/api/explore/v2.1/catalog/datasets/valenbisi-disponibilitat-valenbisi-dsiponibilidad/records?limit=20"
curl -s $API_URL
