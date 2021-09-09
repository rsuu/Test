sudo apt-get install -y g++ cmake ninja-build libx11-dev libxcursor-dev libxi-dev libgl1-mesa-dev libfontconfig1-dev

sudo git clone --recursive https://github.com/aseprite/aseprite.git
cd aseprite
mkdir build
cd build

mkdir ./skia
cd ./skia
sudo wget https://github.com/aseprite/skia/releases/download/m81-b607b32047/Skia-Linux-Release-x64.zip
sudo unzip *zip
cd ../


sudo cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DLAF_BACKEND=skia -DSKIA_DIR=./skia -DSKIA_LIBRARY_DIR=./skia/out/Release-x64 -DSKIA_LIBRARY=./skia/out/Release-x64/libskia.a -G Ninja ..

sudo ninja aseprite

sudo strip bin/aseprite

sudo tar -acf /tmp/aseprite.tar aseprite
