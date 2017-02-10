#!/bin/bash



export OETMP=~/yocto/rpi/build/tmp
export MACHINE=raspberrypi2

./copy_boot.sh sdc
./copy_rootfs.sh sdc console
