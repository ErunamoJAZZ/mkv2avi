::Script hecho por ErunnamoJAZZ
::@mail: anonimato1990@gmail.com
::@version: 0.4.0
::Ejemplo de uso:  mkv2avi.bat VideoSource.mkv VideoSalida
::Ojo, no poner el ".avi", el programa ya lo hace.



echo " %1 "
echo "=======>>> Codificando la parte uno <<<======= "
echo ""
echo ""
echo ""
echo ""


::si no es vacia...
if not "%2"=="" (
    set salida="%2"
) else (
    set salida="Out"
)


echo "La salida ser� $salida.avi"

::Codificaci�n pasada 1
mencoder.exe %1 -vf scale=704:396:param=3,unsharp=c3x3:0.5:l3x3:0.2,hqdn3d,eq=0:5,fixpts=fps=24000/1001,ass,fixpts -ass -sws 9 -noskip -ovc xvid -xvidencopts bitrate=-175000:vhq=4:chroma_me:chroma_opt:hq_ac:trellis:bvhq=1:bquant_ratio=162:bquant_offset=0:packed:quant_type=h263:lumi_mask:threads=2:pass=1:turbo -nosound -ofps 24000/1001 -o /dev/null

echo " $1"
echo "=======>>> Codificando la parte dos <<<======="
echo ""
echo ""
echo ""
echo ""
echo ""


::Codificaci�n pasada 2
mencoder.exe %1 -vf scale=704:396:param=3,unsharp=c3x3:0.5:l3x3:0.2,hqdn3d,eq=0:5,fixpts=fps=24000/1001,ass,fixpts -ass -sws 9 -noskip -ovc xvid -xvidencopts bitrate=-175000:vhq=4:chroma_me:chroma_opt:hq_ac:trellis:bvhq=1:bquant_ratio=162:bquant_offset=0:packed:quant_type=h263:curve_compression_high=0:curve_compression_low=15:keyframe_boost=10:kfthreshold=1:kfreduction=20:lumi_mask:threads=3:pass=2   -oac mp3lame -lameopts vbr=3:preset=standard -ofps 24000/1001 -o %salida%.avi

::Tama�o video ~175MB, tama�o audio ~25MB

echo ""
echo ""
echo ""
echo "=======>>>  Fin n.n  <<<======="
echo ""
::rm divx2pass.log


pause
