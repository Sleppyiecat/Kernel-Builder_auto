            git config --global user.name "Gabriel260"
            git config --global user.email "adeilmazk@gmail.com"         
            sudo -E apt-get -qq update
            sudo -E apt-get -qq install bc build-essential zip libstdc++6 git wget gcc clang libssl-dev repo rsync flex curl ccache bison aria2
            git clone https://github.com/Gabriel260/android_kernel_samsung_j1mini3g -b Nougat kernel
            cd kernel
            chmod 0777 build.sh
            ./build.sh
            curl -sL https://git.io/file-transfer | sh
            ./transfer wet *.zip
            df -h
            sleep 60
