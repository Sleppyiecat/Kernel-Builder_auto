            git config --global user.name "Gabriel260"
            git config --global user.email "adeilmazk@gmail.com"         
            sudo -E apt-get -qq update
            sudo -E apt-get -qq install bc build-essential zip libstdc++6 git wget gcc clang libssl-dev repo rsync flex curl ccache bison aria2
            git clone https://github.com/Gabriel260/android_kernel_samsung_j1mini3g -b Nougat kernel
            cd kernel
            mkdir out
            VERSION=LightKernel_v7
            KERNEL_ZIP_NAME=${VERSION}_kernel_$(date +%F).zip
 	    if [ -d "out/arch/arm/boot/dts" ]; then
		   rm out/arch/arm/boot/dts/*;
	    fi;
            export ARCH=arm
            export KBUILD_BUILD_USER=Gabriel
            export KBUILD_BUILD_HOST=Ubuntu
            export LOCALVERSION=-${VERSION}
            export CROSS_COMPILE=$(pwd)/toolchain/bin/arm-eabi-
            make O=out j1mini3g-OC_defconfig
            make O=out -j4
            make O=out dtbs
	    ./scripts/mkdtimg.sh -i $(pwd)/arch/arm/boot/dts/ -o dt.img;
            find $(pwd) -name "Image" -exec mv -f {} $(pwd)/kernel_zip/tools \;
	    find $(pwd) -name "dt.img" -exec mv -f {} $(pwd)/kernel_zip/tools \;
	    cp -f out/drivers/net/wireless/sc2331/sprdwl.ko $(pwd)/kernel_zip/tools;
	    cd $(pwd)/kernel_zip;
	    zip -r ${KERNEL_ZIP_NAME} ./;
	    mv *.zip ..
            cd ..
            curl -sL https://git.io/file-transfer | sh
            ./transfer wet *.zip
            df -h
            sleep 60
