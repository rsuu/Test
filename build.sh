#!/usr/bin/bash

aaa()
{
    git clone https://github.com/PaddiM8/kalk
cd kalk/kalk_cli
cargo install kalk_cli
ls ~/.cargo/bin
}


bbb(){
    git clone https://github.com/pkolaczk/fclones
    cd fclones
    cargo build --release --target=./
    ls target
}


bbb
