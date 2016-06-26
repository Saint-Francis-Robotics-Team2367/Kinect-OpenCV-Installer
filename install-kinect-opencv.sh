#!/bin/bash

cwd=$(pwd)
sudo apt-get update
sudo apt-get -q -y install git cmake build-essential freeglut3-dev libxmu-dev libxi-dev libopencv-dev libudev-dev wget
sudo apt-get -y remove libusb-1.0-0-dev
cd /tmp

wget http://sourceforge.net/projects/libusb/files/libusb-1.0/libusb-1.0.18/libusb-1.0.18.tar.bz2
tar -xvf libusb-1.0.18.tar.bz2
cd libusb-1.0.18/
./configure --prefix=/usr --disable-static
make
sudo make install
sudo ln -s /usr/lib/libusb-1.0.so /usr/lib/arm-linux-gnueabihf/libusb-1.0.so

cd /tmp

git clone https://github.com/OpenKinect/libfreenect
cd libfreenect
mkdir build
cd build
cmake ..
cmake .. -DBUILD_CV=ON
make
sudo make install

cd $cwd
git clone https://github.com/Saint-Francis-Robotics-Team2367/GoalDetection.git
cd GoalDetection/pi/kinect/c
cmake .
cmake .
make
