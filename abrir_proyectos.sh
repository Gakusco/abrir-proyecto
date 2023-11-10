#!/bin/bash

# Define la ruta raíz de tus proyectos
PROYECTOS_ROOT="/c/proyectos"

# Función para listar los proyectos
listar_proyectos() {
    echo "Lista de proyectos en $PROYECTOS_ROOT:"
    proyectos=($(find "$PROYECTOS_ROOT" -maxdepth 1 -type d))
    for ((i=0; i<${#proyectos[@]}; i++)); do
        nombre_proyecto=$(basename "${proyectos[$i]}")
        echo "$i. $nombre_proyecto"
    done
}

# Función para abrir un proyecto
abrir_proyecto() {
    listar_proyectos
    read -p "Seleccione el número del proyecto para abrir: " opcion

    if [[ $opcion =~ ^[0-9]+$ ]] && [ $opcion -ge 0 ] && [ $opcion -lt ${#proyectos[@]} ]; then
        code "${proyectos[$opcion]}"
    else
        echo "Opción no válida."
    fi
}

# Llama a la función para abrir un proyecto
abrir_proyecto

