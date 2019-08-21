#!/bin/bash
# Hèctor Martínez Alcaraz 12/08/2019

# Script para contar conexiones a la IP definida en el primer parametro y guardar un log con la hora.


NConex=$(netstat -lan | awk '{print $5}' | awk -F \: '{print $1}' | grep $1 | wc -l)
hora=$(date +%k:%M:%S)

if [ $1 ]; then

    echo $hora $NConex >>  log.txt
else
    echo "Introduce una ip en el primer parametro"
fi
