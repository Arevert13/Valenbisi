#!/bin/bash

API_URL="https://valencia.opendatasoft.com/api/explore/v2.1/catalog/datasets/valenbisi-disponibilitat-valenbisi-dsiponibilidad/records?limit=20"
OUTPUT_FILE="data.json"
HISTORICAL_FILE="historico_bicis.csv"

# Verifica si el archivo histórico ya existe; si no, crea el encabezado
if [ ! -f "$HISTORICAL_FILE" ]; then
    echo "Fecha,Estación,Disponible" > "$HISTORICAL_FILE"
fi

# Función para descargar los datos y almacenar en el histórico
obtener_datos() {
    # Descarga los datos desde la API
    curl -s "$API_URL" -o "$OUTPUT_FILE"

    # Extrae la fecha actual
    fecha=$(date +"%Y-%m-%d %H:%M:%S")

    # Procesa el archivo JSON para obtener "Address" y "available"
jq -r '.records[] | "\(.record.fields.address ),\(.record.fields.available // 0)"' "$OUTPUT_FILE" | while IFS="|" read -r estacion disponible; do
        # Escribe la información en el archivo histórico
    echo "$fecha,$estacion,$disponible" >> "$HISTORICAL_FILE"
    done
}

# Bucle infinito que repite el proceso cada 5 segundos
while true; do
    obtener_datos
    sleep 5
done
