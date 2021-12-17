#!/bin/bash

mkdir pos
g++ collisions.cpp -o col
./col
rm col
cp render.sh pos/
cp pos_template.pov pos/
cd pos
./render.sh
#ffmpeg -framerate 60 -i frame_%d.png 2dcol.gif
ffmpeg -framerate 60 -i frame_%d.png 2dcol.mp4
