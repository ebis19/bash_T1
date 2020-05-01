#!/bin/bash

function help () {
    echo ""
    echo "$0 -t Numero,(default = 2) el intervalo de los segundo entre que se verifica si se ingreso un nuevo archivo "
    echo "$0 -f Directorio,el directorio donde se busca los archivos , si no se indica se ejecutara en el directorio del script"
    echo "$0 -d se ejecuta el script en modo demonio"
}




function eliminar () {
    eliminar=$(ls $DIR | sort -V|awk '/^.*-[0-9]{1,2}.log$/{
    n=match($1,/-[0-9]{2}.log/)
    noeliminar[substr($1,0,n)]= $1
    eliminar[$1]=substr($1,0,n);
}

END{
    for (i in noeliminar){   
        if(i!="")
            delete eliminar[noeliminar[i]];
        }
    for (i in eliminar)
         print i;
}')

for archivo in $eliminar ; do
    rm "$DIR/$archivo"
done
}

function inicio() {

eliminar
md51="$(ls $DIR | awk '/^.*-[0-9]{1,2}.log$/' | md5sum |awk '{ print $1}')"
while(true)
do
    md52="$(ls $DIR | awk '/^.*-[0-9]{1,2}.log$/'| md5sum |awk '{ print $1}')"
    if [ "$md51" != "$md52" ] ; then
        eliminar
    fi
    md51=$md52
    sleep "$SECOND"
done
}
# valores de default 
SECOND="2" 
DIR="."

if [ "$2" == "--help" ] ;then
    help
fi



while getopts t:f:h:d opt; do
  case $opt in
    f)
    DIR=$OPTARG
      ;;
    t)
      SECOND=$OPTARG
      ;;
    h)
      help
      exit 0
      ;;
    d) 
       nohup "$0" "-f $DIR -t $SECOND" >& /dev/null &
        exit
      ;;
    \?) #unrecognized option - show help
      help
      exit 3
      ;;
  esac
done

		
if [ "$SECOND" != "" ] ;then
    inicio  
fi
	 
