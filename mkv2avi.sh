#Script hecho por ErunnamoJAZZ
#@mail: anonimato1990@gmail.com
#@version: 0.4.0
#Ejemplo de uso:  ./mkv2avi.sh VideoSource.mkv VideoSalida
#Ojo, no poner el ".avi", el programa ya lo hace.

echo 

echo "
$1
=======>>> Codificando la parte uno <<<=======


"
#si no es vacia...
if [ $2 ] ; then
    salida=$2
else #de lo contrario
    salida="Out"
fi


echo "La salida será $salida.avi"

#Codificación pasada 1
mencoder $1 -vf hue=0.0:1.1,scale=704:396:param=3,unsharp=c3x3:0.5:l3x3:0.2,\
eq=0:5,hqdn3d,fixpts=fps=24000/1001,ass,fixpts -ass -sws 9 -noskip \
-ovc xvid -xvidencopts bitrate=1000:vhq=4:chroma_me:chroma_opt:hq_ac:\
trellis:bvhq=1:bquant_ratio=162:bquant_offset=0:packed:quant_type=h263:\
lumi_mask:threads=2:pass=1:turbo \
-nosound -ofps 24000/1001 -o /dev/null

echo "



$1
=======>>> Codificando la parte dos <<<=======



"
#Codificación pasada 2
mencoder $1 -vf hue=0.0:1.1,scale=704:396:param=3,unsharp=c3x3:0.5:l3x3:0.2,\
eq=0:5,hqdn3d,fixpts=fps=24000/1001,ass,fixpts -ass -sws 9 -noskip \
-ovc xvid -xvidencopts bitrate=1000:vhq=4:chroma_me:chroma_opt:\
hq_ac:trellis:bvhq=1:bquant_ratio=162:bquant_offset=0:packed:quant_type=h263:\
curve_compression_high=0:curve_compression_low=15:keyframe_boost=10:\
kfthreshold=1:kfreduction=20:lumi_mask:threads=3:pass=2 \
-oac mp3lame -lameopts vbr=3:preset=standard -ofps 24000/1001 -o $salida.avi

#Tamaño video ~175MB, tamaño audio ~25MB

echo "


=======>>>  Fin n.n  <<<======="
rm divx2pass.log
