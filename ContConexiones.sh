#!/bin/bash
# Hector Martinez Alcaraz 12/08/2019

# Script para contar conexiones a la IP definida en el primer parametro


NConex=$(netstat -lan | awk '{print $5}' | awk -F \: '{print $1}' | grep $1 | wc -l)
hora=$(date +%k:%M:%S)

if [ $1 ]; then

    echo $hora $NConex >>  /home/weblogic/ContarConexiones/ContadorConexiones.txt
else
    echo "Introduce una ip en el primer parametro"
fi
