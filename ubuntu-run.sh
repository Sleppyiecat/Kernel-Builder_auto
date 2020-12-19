            git config --global user.name "Sleppyiecat"
            git config --global user.email "mruczek70@gmail.com"         
            sudo -E apt-get -qq update
            sudo -E apt-get -qq install bc build-essential zip libstdc++6 git wget gcc clang libssl-dev repo rsync flex curl ccache bison aria2
            cd android_kernel_samsung_exynos7885
            mkdir out
            VERSION=Yuuko kernel
            KERNEL_ZIP_NAME=${VERSION}_kernel_$(date +%F).zip
 	    if [ -d "out/arch/arm/boot/dts" ]; then
		   rm out/arch/arm/boot/dts/*;
	    fi;
            export ARCH=arm
            export KBUILD_BUILD_USER=Yuuko
            export KBUILD_BUILD_HOST=Ubuntu
            export LOCALVERSION=-${VERSION}
            export CROSS_COMPILE=$(pwd)/Toolchains-for-Eureka/bin/arm-eabi-
            make O=out a10_new_defconfig
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
