#!/bin/sh
skip=44

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
��X�Wovpn ��MOA���O1��v��=H<���C+ۤi/�v�VW//͒HA,jES��*JMm�����쉯�YF!��q��?���y�?;S+Wo����,?.&Ͻ��aK��3��I34���E�_�����y�A`�iF�nƯ ��=N�>� �9�P����NAx.��u�:Щ��˶������
_p5��V��.�^5"��iF��WD�T3{8�g�z��,t��ǧ�LM?�=8_5�va����;S3�i�)0��K%���Z��j�L���E���G��˪~��%ۯU�:uy�M�`����T4r#cc|Z@�|w+o�tqP��΂�I�sQj�������<��v?��R���	%P���}�	�������ڤpW�x�8x��\����v���9�q�V<)���C�X.�oG�8o�����Y6�[0�2�8J|��u]�#�K��8��c�k<,���?�B��Ү�j�\#�/�/�DH�fI��K��\��[?s�ʛWrL��!�'ǟO)R��fy/9ZV���&���M1.�C�0�&�6�;����f�%�Ƀ]%χ��9F���8��/�v�B��� �y3���E�@��
�K�  