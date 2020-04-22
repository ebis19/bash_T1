#!/bin/bash 
ErrorS() { 
    echo "Error. La sintaxis del script es la siguiente:"
    echo "Cantidad de lineas en el archivo: $0 nombre_archivo L" # COMPLETAR
    echo "Cantidad de caracteres en el archivo: $0 nombre_archivo C" # COMPLETAR 
    echo "El tamaño  maximo de las lineas : $0 nombre_archivo M" # COMPLETAR 
    } 
ErrorP() { 
    echo "Error. El archivo $1 no existe o no tiene permisos de lectura  " # Se indica no se puede leer el archivo 
    }

if  test $# -lt 2 ;then # Verifica que se ingreso los paramentros correctamente 
     ErrorS
fi
if !(test -r $1);then #  Verifica si se puede  leer archivo
    ErrorP 
    elif test -f $1 && (test $2 = "L" || test $2 = "C" || test $2 = "M"); then
    if test $2 = "L"; then 
        res=`wc -l $1`
        echo "La cantidad de linias es : $res" # Si el segundo parametro es igual a L ee cuenta y imprime la cantidad de lineas en el archivo 
    elif test $2 = "C"; then 
        res=`wc -m $1` 
        echo "La cantidad de caracteres es: $res" # Si el segundo parametro es igual a C se cuenta y imprime la cantidad de char en el archivo incluyendo \n
    elif test $2 = "M"; then 
        res=`wc -L $1`
        echo "La cantidad de caracteres en la linea más larga: $res" # Si el segundo parametro es igual a M se cuenta y se imprime el tamaño maximo  en el archivo
    fi
else
     ErrorS 
fi


#a)
#
#b) El script tiene dos parametros : [Archivo] [Char] 
# En el primero se indica el archivo a prosesar
# En el segundo la opcion deseada (L,C,M) 
#e) La variable "$#" indica la cantidad de parametros ingresados 
#Otras variables expeciales de bash son:
# $i ($1,$2 ... $n) indica el parametros del script 
# $@ muestras todos los parametros 
# $$ el id de proceso 
# $USER El usuario que esta ejecutando el script
# $HOME la ruta del usuario
#
#f)las diferentes comillas son    

# "" Encierran textos y interpreta las variables dentro de las comillas
# ej echo " EL USUARIO ES $USER"  
#    EL USUARIO ES user1
# '' Tambien encierran textos pero a diferenciade las anteriores se intrepreta de forma literal 
# ej echo " EL USUARIO ES $USER"  
#    EL USUARIO ES $USER 

# `` Ejecutan el codigo contenidas en ellas 
# echo `pwd`
# /home/user1
