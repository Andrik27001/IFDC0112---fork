#!/bin/bash

# Compilar el programa con NASM
yasm -f elf64 -g dwarf2 -o initial.o initial.asm

# Verifica si el archivo objeto se generó correctamente
if [ ! -f initial.o ]; then
    echo "Error: No se generó el archivo objeto initial.o"
    exit 1
fi

# Enlazar el archivo objeto con 'ld' para crear el ejecutable
ld -s -o initial initial.o

# Verifica si el ejecutable se generó correctamente
if [ ! -f initial ]; then
    echo "Error: No se generó el ejecutable initial"
    exit 1
fi

# Pausar antes de ejecutar el programa para asegurarse de que el ejecutable se haya creado
echo "El ejecutable ha sido creado con éxito. Ejecutando el programa..."
sleep 2  # Pausa de 2 segundos (puedes cambiar el tiempo si lo necesitas)

# Ejecutar el programa
./initial

# Imprimir el código de salida del programa
echo "Código de salida: $?"