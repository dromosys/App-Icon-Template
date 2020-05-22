#!/bin/bash

INK=/snap/bin/inkscape


while getopts ":f:s:" opt; do
  case $opt in
    f) SVG="$OPTARG"
    ;;
    s) SIZE1="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

BASE=`basename "$SVG" .svg`
SIZE2=$((SIZE1 * 2))
SIZE3=$((SIZE1 * 3))

printf "Argument SVG is %s\n" "$SVG"
printf "Argument BASE is %s\n" "$BASE"
printf "Argument SIZE1 is %s\n" "$SIZE1"
printf "Argument SIZE2 is %s\n" "$SIZE2"
printf "Argument SIZE3 is %s\n" "$SIZE3"

OUTPATH="./${BASE}-ios/${BASE}_${SIZE1}pt.xcassets/${BASE}_${SIZE1}pt.imageset"
mkdir -p $OUTPATH

$INK $SVG --export-area-page --export-width=$SIZE1 --export-height=$SIZE1 --export-filename="${OUTPATH}/${BASE}_${SIZE1}pt_1x.png"
$INK $SVG --export-area-page --export-width=$SIZE2 --export-height=$SIZE2 --export-filename="${OUTPATH}/${BASE}_${SIZE1}pt_2x.png"
$INK $SVG --export-area-page --export-width=$SIZE3 --export-height=$SIZE3 --export-filename="${OUTPATH}/${BASE}_${SIZE1}pt_3x.png"

JSON='{
    "images": [
        {
            "filename": "'${BASE}_${SIZE1}'pt_1x.png",
            "idiom": "universal",
            "scale": "1x"
        },
        {
            "filename": "'${BASE}_${SIZE1}'pt_2x.png",
            "idiom": "universal",
            "scale": "2x"
        },
        {
            "filename": "'${BASE}_${SIZE1}'pt_3x.png",
            "idiom": "universal",
            "scale": "3x"
        }
    ],
    "info": {
        "author": "xcode",
        "template-rendering-intent": "template",
        "version": 1
    }
}'
echo $JSON | python -m json.tool > "${OUTPATH}/Contents.json"
#echo $JSON > "${OUTPATH}/Contents.json"
