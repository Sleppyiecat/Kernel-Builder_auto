            git config --global user.name "Gabriel260"
            git config --global user.email "adeilmazk@gmail.com"         
            sudo -E apt-get -qq update
            sudo -E apt-get -qq install bc build-essential zip libstdc++6 git wget gcc clang libssl-dev repo rsync flex curl ccache bison aria2
            git clone https://github.com/Gabriel260/android_kernel_samsung_j1mini3g -b Nougat kernel
            cd kernel
            export ARCH=arm
            export KBUILD_BUILD_USER=Gabriel
            export KBUILD_BUILD_HOST=Ubuntu
            export LOCALVERSION=-LightKernel_v7
            export CROSS_COMPILE=$(pwd)/toolchain/bin/arm-eabi-
            make O=out j1mini3g-OC_defconfig
            make O=out -j4
            cd out/arch/arm/boot
            curl -sL https://git.io/file-transfer | sh
            ./transfer wet Image
            df -h
            sleep 60
