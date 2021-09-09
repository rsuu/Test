sudo mkdir ~/deps/skia
cd ~/deps/dkia
sudo wget https://github.com/aseprite/skia/releases/download/m81-b607b32047/Skia-Linux-Release-x64.zip
sudo unzip *zip


sudo apt-get install -y g++ cmake ninja-build libx11-dev libxcursor-dev libxi-dev libgl1-mesa-dev libfontconfig1-dev


cd ~
sudo git clone --recursive https://github.com/aseprite/aseprite.git

sudo mkdir build

cd build


sudo cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DLAF_BACKEND=skia -DSKIA_DIR=$HOME/deps/skia -DSKIA_LIBRARY_DIR=$HOME/deps/skia/out/Release-x64 -DSKIA_LIBRARY=$HOME/deps/skia/out/Release-x64/libskia.a -G Ninja ..

sudo ninja aseprite
