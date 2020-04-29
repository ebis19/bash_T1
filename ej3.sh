#!/bin/bash



function help () {
    echo "help" # arguments are accessible through help, echo "$1" # arguments are accessible throughhelp, ,...,...
}

while getopts t:f:h opt; do
  case $opt in

    t)
      DIR=$OPTARG
      ;;
    f)
      SECOND=$OPTARG
      ;;
    h)
      help
      ;;
    \?) #unrecognized option - show help
      echo -e \\n"Option -${BOLD}$OPTARG${OFF} not allowed."
      HELP
      ;;
  esac
done



md51 =`ls  | awk '/^.*-[0-9]{1,2}.log$/'|md5sum`
while(true){
    md52 =`ls  | awk '/^.*-[0-9]{1,2}.log$/'|md5sum`
    if(md51 != md52 );then
        eliminar
    fi
    md51=md52
    sleep $SECOND
}

function eliminar () {
    eliminar=$(ls  | awk '/^.*-[0-9]{1,2}.log$/{
    n=match($1,/[0-9]{2}/)
    noeliminar[substr($1,0,n-1)]= $1
    eliminar[$1]=0;
}
END{
    for (i in noeliminar)
        delete eliminar[noeliminar[i]]
    for (i in eliminar)
         print i;
}')
for archivo in $eliminar ; do
    print $archivo
    rm $archivo
done

}