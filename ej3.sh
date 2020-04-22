#!/bin/bash


eliminar=$(ls | awk '/^.*-[0-9]{1,2}.log$/{
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