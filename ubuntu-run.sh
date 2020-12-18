            git config --global user.name "Gabriel260"
            git config --global user.email "adeilmazk@gmail.com"         
            sudo -E apt-get -qq update
            sudo -E apt-get -qq install bc build-essential zip libstdc++6 git wget gcc clang libssl-dev repo rsync flex curl ccache bison aria2
            git clone https://github.com/Gabriel260/android_kernel_samsung_exynos7885 -b upstream kernel
            cd kernel
            git clone https://github.com/Gabriel260/Linaro-V6.5.0 toolchain
            export ARCH=arm64
            export ANDROID_MAJOR_VERSION=q
            export KBUILD_BUILD_USER=Gabriel
            export KBUILD_BUILD_HOST=Ubuntu
            export CROSS_COMPILE=$(pwd)/toolchain/bin/aarch64-linux-gnu-
            export CROSS_COMPILE_ARM32=$(pwd)/toolchain/bin/arm-linux-gnueabi-
            make clean
            make mrproper
            make a10_defconfig
            make -j4
            cd arch/arm64/boot
            curl -sL https://git.io/file-transfer | sh
            ./transfer wet Image
            ./transfer wet dtbo.img
            df -h
            sleep 60
