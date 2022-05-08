build-skia() {
    mkdir $HOME/deps
    cd $HOME/deps

    git clone --depth 1 https://chromium.googlesource.com/chromium/tools/depot_tools.git
    git clone --depth 1 -b aseprite-m96 https://github.com/aseprite/skia.git

    cd skia

    sudo python tools/git-sync-deps
    sudo $HOME/deps/depot_tools/gn gen out/Release-x64 --args="is_debug=false is_official_build=true skia_use_system_expat=false skia_use_system_icu=false skia_use_system_libjpeg_turbo=false skia_use_system_libpng=false skia_use_system_libwebp=false skia_use_system_zlib=false skia_use_sfntly=false skia_use_freetype=true skia_use_harfbuzz=true skia_pdf_subset_harfbuzz=true skia_use_system_freetype2=false skia_use_system_harfbuzz=false"

    ninja -C out/Release-x64 skia modules
}

build-aseprite() {
    #SkiaVersion="https://github.com/aseprite/skia/releases/download/m96-2f1f21b8a9/Skia-Linux-Release-x64.zip"

    sudo apt-get install -y g++ cmake ninja-build libx11-dev libxcursor-dev libxi-dev libgl1-mesa-dev libfontconfig1-dev

    sudo git clone --recursive --depth 1 https://github.com/aseprite/aseprite.git

    cd aseprite && sudo mkdir build && cd build

    #sudo mkdir ./skia
    #cd ./skia
    #sudo wget $SkiaVersion && sudo unzip *zip
    #cd ../

    sudo cmake \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DLAF_BACKEND=skia \
        -DSKIA_DIR=$HOME/deps/skia \
        -DSKIA_LIBRARY_DIR=$HOME/deps/skia/out/Release-x64 \
        -DSKIA_LIBRARY=$HOME/deps/skia/out/Release-x64/libskia.a \
        -G Ninja \
        ..

    sudo ninja aseprite
    sudo strip bin/aseprite

    sudo tar -acf /tmp/aseprite.tar.zst bin

}

build-skia && build-aseprite
