#!/bin/bash
if [$# -eq 0]; then
echo "Por favor, proporciona el nombre de la estación." 
exit 1 

fi
nombre_estacion=$1
url="https://valencia.opendatasoft.com/api/explore/v2.1/catalog/datasets/valenbisi-disponibilitat-valenbisi-dsiponibilidad/records?limit=20"


monitorizar_estación () {
    while true; do 
    resultado=$(curl -s "$url" | jq --arg nombre "$nombre_estacion" '.records[] | select(.fields.name == $nombre) | {name: .fields.name, available_bikes: .fields.available_bikes}')
    if [ -z "$resultado" ]; then
            echo "Estación '$nombre_estacion' no encontrada. Inténtalo de nuevo con un nombre válido."
            exit 1
        else
            
            echo "$resultado"
        fi

        
        sleep 30
    done
}

