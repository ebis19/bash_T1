#!/bin/bash 
ErrorS() { 
    echo "Error. La sintaxis del script es la siguiente:"
    echo "......................: $0 nombre_archivo L" # COMPLETAR
    echo "......................: $0 nombre_archivo C" # COMPLETAR 
    echo "......................: $0 nombre_archivo M" # COMPLETAR 
    } 
ErrorP() { 
    echo "Error.  $1 no se puede leer  " # COMPLETAR
    }

if  test $# -lt 2 ;then
     ErrorS
fi
if !(test -r $1);then
    ErrorP 
elif test -f $1 && (test $2 = "L" || test $2 = "C" || test $2 = "M"); then
    if test $2 = "L"; then 
        res=`wc -l $1`
        echo "La cantidad de linias es : $res" # COMPLETAR
    elif test $2 = "C"; then 
        res=`wc -m $1` 
        echo "La cantidad de char es: $res" # COMPLETAR
    elif test $2 = "M"; then 
        res=`wc -L $1`
        echo "La cantidad char en la linea más larga: $res" # COMPLETAR
    fi
else
     ErrorS 
fi