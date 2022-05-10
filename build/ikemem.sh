#!/bin/bash

sudo apt install -y golang-go git libgl1-mesa-dev xorg-dev libopenal1 libopenal-dev

git clone https://github.com/Windblade-GR01/Ikemen-GO.git

cd Ikemen-GO && make Ikemen_GO_Linux

#cp font.ttf /usr/share/fonts/arial.ttf
#MESA_GL_VERSION_OVERRIDE=4.4 ./Ikemen_GO_Linux -r mugen1
