# Installing NVIDIA on Linux (Ubuntu 20.04/21.04)

Check out what the latest version number is in the following site:
https://launchpad.net/~graphics-drivers/+archive/ubuntu/ppa

While writing this, the latest version is 470, so let's use that number.
Notice that it should be "nvidia-driver-470", *not* "nvidia-470" or "nvidia-graphics-driver-470"

 ```sh
sudo apt-add-repository ppa:graphics-drivers/ppa
sudo apt-get update
sudo apt install -y nvidia-driver-470 nvidia-cuda-toolkit nvidia-utils-470
```

Verify that the drivers are now installed

 ```sh
 lsmod | grep nvidia
```

Create Nvidia config file with cool-bits set

 ```sh
sudo nvidia-xconfig -a --cool-bits=31 --allow-empty-initial-configuration
```

It will say something like "...New X configuration file written..." :thumbsup:

Next up, let's use nvidia-smi to get info about the rigs GPU:s and make sure they are all detected

 ```sh
nvidia-smi
```

Trying to control the GPU:s will throw errors at your way (fans, clock-settings, etc..),
unless you add the following line to your ~/.bashrc:

 ```sh
export DISPLAY=:0
```

It will take effect on the next login, unless you source ~/.bashrc:

 ```sh
source ~/.bashrc
```

Looks good? Now reboot!

 ```sh
sudo reboot now
```
