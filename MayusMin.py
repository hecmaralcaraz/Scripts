# Python 3
# Hèctor Martínez Alcaraz 21/08/2019

# Este programa sirve para transformar una cadena de caracteres de mayus a minus y viceversa.
# Requisitos: Se necesita la libreria pyperclip

# Imports

import pyperclip


# Funciones

def MayMin():
    '''Transforma un texto en mayuscúlas a minuscúlas'''
    palabra = input('\nPor favor, escriba el texto a transformar.\n>')
    return palabra.lower()

def MinMay():
    '''Transforma un texto en minuscúlas a mayuscúlas'''
    palabra = input('\nPor favor, escriba el texto a transformar.\n>')
    return palabra.upper()


# Main

while True:
    print('Buenos días señor.')
    print('¿Que desea transformar hoy?\n')
    print('1. De mayuscúlas a minuscúlas')
    print('2. De minuscúlas a mayuscúlas')
    opcion = input('\n>')
    if opcion == '1':
        texto = MayMin()
        print('\n'+texto)  # imprime el texto transformado
        break
    elif opcion == '2':
        texto = MinMay()
        print('\n'+texto)  # imprime el texto transformado
        break

pyperclip.copy(texto)  # copia el texto al portapapeles

print('\nEl texto se ha copiado al portapapeles.')
exit = input('Presione Enter para salir...')
