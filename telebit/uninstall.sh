#!/usr/bin/env bash

if (( $EUID != 0 )); then
    echo "Please run as root"
    exit 1
fi

systemctl stop telebit.service
systemctl disable telebit.service
rm /lib/systemd/system/telebit.service
rm -rf /opt/telebit
