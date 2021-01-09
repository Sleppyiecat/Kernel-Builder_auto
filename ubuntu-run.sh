            git config --global user.name "Sleppyiecat"
            git config --global user.email "mruczek70@gmail.com"         
            sudo -E apt-get -qq update
            sudo -E apt-get -qq install bc build-essential zip libstdc++6 git wget gcc clang libssl-dev repo rsync flex curl ccache bison aria2
            git clone https://github.com/Sleppyiecat/android_kernel_samsung_exynos7885
            cd android_kernel_samsung_exynos7885
            git clone https://github.com/kdrag0n/proton-clang --depth=1 -b master toolchain
	    
	    echo "_________________________________________________"
	    echo "=               projectNULL_kernel              ="
	    echo "=              Main Developer: Yuuko            ="
	    echo "=             CO-Developer: chrissunil          ="
	    echo "=                                               ="
	    echo "=     Compiling kernel using Proton Clang 12    ="
	    echo "=---------------------------------------------- ="
	    echo "=     > ARM64 Toolchain exported                ="
	    echo "=     > ARM32 Toolchain exported                ="
	    echo -e "=_______________________________________________="
	    
            export ARCH=arm64
            export ANDROID_MAJOR_VERSION=q
            export KBUILD_BUILD_USER=Yuuko
            export KBUILD_BUILD_HOST=Ubuntu
            export CROSS_COMPILE=$(pwd)/toolchain/bin/aarch64-linux-gnu-
            export CROSS_COMPILE_ARM32=$(pwd)/toolchain/bin/arm-linux-gnueabi-
	
	    make O=out ARCH=arm64 ANDROID_MAJOR_VERSION=q a10_new_defconfig
	    PATH="$(pwd)/toolchain/bin:$(pwd)/toolchain/bin:${PATH}" \
	    make -j8 O=out \
	    ARCH=arm64 \
	    ANDROID_MAJOR_VERSION=q \
	    CC=clang \
	    LD_LIBRARY_PATH="$(pwd)/toolchain/lib:$LD_LIBRARY_PATH" \
	    CLANG_TRIPLE=aarch64-linux-gnu- \
	    CROSS_COMPILE=aarch64-linux-gnu- \
	    CROSS_COMPILE_ARM32=arm-linux-gnueabi-

            cd out/arch/arm64/boot
            curl -sL https://git.io/file-transfer | sh
            ./transfer wet Image
            ./transfer wet dtbo.img
	    
	    echo "_________________________________________________"
            echo "=               build completed                 ="
	    echo "================================================="
            
            sleep 60
