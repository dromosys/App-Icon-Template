#!/bin/bash

INK=/usr/local/bin/inkscape

if [[ -z "$1" ]] 
then
	echo "SVG file needed."
	exit;
fi

BASE=`basename "$1" .svg`
SVG="$1"

# iPhone and iPad Notification iOS 7-11 20pt
$INK -z -D --export-filename="$BASE-20.png"  	$SVG -w 20 -h 20
$INK -z -D --export-filename="$BASE-20@2x.png"  	$SVG -w 40 -h 40
$INK -z -D --export-filename="$BASE-20@3x.png"       $SVG -w 60 -h 60

# iPhone Spotlight iOS5,6 Settings iOS and iPad 5-8 29pt
$INK -z -D --export-filename="$BASE-29.png"  	$SVG -w 29 -h 29
$INK -z -D --export-filename="$BASE-29@2x.png"  	$SVG -w 58 -h 58
$INK -z -D --export-filename="$BASE-29@3x.png"       $SVG -w 87 -h 87

# iPhone Spotlight iOS7,8 40pt
$INK -z -D --export-filename="$BASE-40@2x.png"  	$SVG -w 80 -h 80
$INK -z -D --export-filename="$BASE-40@3x.png"       $SVG -w 120 -h 120

# iPhone App iOS 5,6 57pt
$INK -z -D --export-filename="$BASE-57.png"  	$SVG -w 57 -h 57
$INK -z -D --export-filename="$BASE-57@2x.png"  	$SVG -w 114 -h 114

# iPhone App iOS 7,8 60pt
$INK -z -D --export-filename="$BASE-60@2x.png"  	$SVG -w 120 -h 120
$INK -z -D --export-filename="$BASE-60@3x.png"       $SVG -w 180 -h 180

# iPad Spotlight iOS 7 40pt
$INK -z -D --export-filename="$BASE-40.png"  	$SVG -w 40 -h 40

# iPad Spotlight iOS 5,6 50pt
$INK -z -D --export-filename="$BASE-50.png"  	$SVG -w 50 -h 50
$INK -z -D --export-filename="$BASE-50@2x.png"  	$SVG -w 100 -h 100

# iPad App iOS 5,6 72pt
$INK -z -D --export-filename="$BASE-72.png"  	$SVG -w 72 -h 72
$INK -z -D --export-filename="$BASE-72@2x.png"  	$SVG -w 144 -h 144

# iPad App iOS 7  76pt
$INK -z -D --export-filename="$BASE-76.png"  	$SVG -w 76 -h 76 
$INK -z -D --export-filename="$BASE-76@2x.png"  	$SVG -w 152 -h 152

# iPad Pro App iOS 9-11  83.5pt
$INK -z -D --export-filename="$BASE-83_5@2x.png"  	$SVG -w 167 -h 167

#iTunes Artwork
$INK -z -D --export-filename="$BASE-512.png"  	$SVG -w 512 -h 512
$INK -z -D --export-filename="$BASE-1024.png"  	$SVG -w 1024 -h 1024

cp "$BASE-512.png" iTunesArtwork.png
cp "$BASE-1024.png" iTunesArtwork@2x.png
