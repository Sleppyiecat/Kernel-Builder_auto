            git config --global user.name "Sleppyiecat"
            git config --global user.email "mruczek70@gmail.com"         
            sudo -E apt-get -qq update
            sudo -E apt-get -qq install bc build-essential zip libstdc++6 git wget gcc clang libssl-dev repo rsync flex curl ccache bison aria2
            cd davinci
            mkdir out
            export ARCH=arm
            export KBUILD_BUILD_USER=Karou
            export KBUILD_BUILD_HOST=Ubuntu
            export LOCALVERSION=-${VERSION}
            export CROSS_COMPILE=$(pwd)/Toolchains/bin/arm-eabi-
            make O=out davinci_defconfig
            make O=out -j4
            make O=out 
            sleep 60
