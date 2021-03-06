# Installing NVIDIA on Linux (Ubuntu 20.04/21.04)

Check out what the latest version number is in the following site:
https://launchpad.net/~graphics-drivers/+archive/ubuntu/ppa

While writing this, the latest version is 470, so let's use that number.
Notice that it should be "nvidia-driver-470", *not* "nvidia-470" or "nvidia-graphics-driver-470"
Run one command at a time!

 ```sh
sudo apt-add-repository ppa:graphics-drivers/ppa
```

 ```sh
sudo apt-get update
```

 ```sh
sudo apt install -y nvidia-driver-470
```

 ```sh
sudo apt install -y nvidia-cuda-toolkit
```

 ```sh
sudo apt install -y nvidia-utils-470
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
unless you add "export DISPLAY=:0" to ~/.bashrc:

 ```sh
echo >> ~/.bashrc # new line
echo "export DISPLAY=:0" >> ~/.bashrc
```

It will take effect on the next login, unless you source ~/.bashrc:

 ```sh
source ~/.bashrc
```

Looks good? Now reboot!

 ```sh
sudo reboot now
```
