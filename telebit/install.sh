#!/usr/bin/env bash




DOWNLOAD_URL=https://get.telebit.io

if [ ! $(which curl) ]; then
    echo 'Please install curl package'
    exit 1
fi


if (( $EUID != 0 )); then
    echo "Please runing as root is needed in order to install the service "
    exit 1
fi

#if [ -z "$1" ]; then
#    echo "./install.sh"
#    exit 1
#fi

#if [ ! -e ngrok.service ]; then
#    git clone --depth=1 https://github.com/vincenthsu/systemd-ngrok.git
#    cd systemd-ngrok
#fi

cp telebit.service /lib/systemd/system/
mkdir -p /opt/telebit


cd /opt/telebit
echo "Downloading and installing telebit . . ."
curl -fsSL $DOWNLOAD_URL | bash 
chmod +x telebit


systemctl enable telebit.service



systemctl start telebit.service


echo "Done installing telebit"
exit 0
