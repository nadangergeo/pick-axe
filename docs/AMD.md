# Installing AMD Drivers on Linux (Ubuntu 20.04.3)

Al right, we will use this official guide
https://www.amd.com/en/support/kb/release-notes/rn-amdgpu-unified-linux-20-45

... but in combination with this version of the driver
https://www.amd.com/en/support/kb/release-notes/rn-amdgpu-unified-linux-20-50

## Install linux kernel 5.4.0-42

First, let's install kernel version 5.4.0-42.

 ```sh
sudo apt-get install linux-image-5.4.0-42-generic linux-modules-5.4.0-42-generic linux-modules-extra-5.4.0-42-generic linux-headers-5.4.0-42-generic
```
## Edit grub

Next, let's see print out the id to use for grub (next step)

 ```sh
menuentry_id_option1=`grep submenu /boot/grub/grub.cfg | tail -c -58 | head -c 54`
menuentry_id_option2=`grep gnulinux /boot/grub/grub.cfg | grep 5.4.0 | head -n 1 | tail -c 75 | head -c 71`
menuentry_id_option="$menuentry_id_option1>$menuentry_id_option2"
echo $menuentry_id_option
```

In my case, I got:
gnulinux-advanced-9bcf85d0-59fb-44c5-8b22-06ceb98578be>gnulinux-5.4.0-42-generic-advanced-9bcf85d0-59fb-44c5-8b22-06ceb98578be

Now, let's edit grub to use the old kernel.

 ```sh
# backup grub
sudo cp /etc/default/grub /etc/default/grub_backup
# edit grub
sudo nano /etc/default/grub
```
Change GRUB_DEFAULT=0 to the following:

GRUB_DEFAULT="gnulinux-advanced-9bcf85d0-59fb-44c5-8b22-06ceb98578be>gnulinux-5.4.0-42-generic-advanced-9bcf85d0-59fb-44c5-8b22-06ceb98578be"

Save by pressing:
ctrl+x
y
ENTER

After the edits, we need to update grub
and the reboot!

 ```sh
sudo update-grub
sudo reboot
```



## check kernel version
 ```sh
uname -r
```

It should return "5.4.0-42-generic"

## uninstall the newer kernels
 ```sh
sudo apt-get -y purge linux*5.8* linux*5.11*
```

## preventing kernel upgrade
 ```sh
sudo apt-mark hold linux-generic-hwe-20.04 linux-image-generic-hwe-20.04 linux-headers-generic-hwe-20.04
```

## download driver (Radeon™ Software for Linux® 20.50)
 ```sh
wget --referer=http://support.amd.com https://drivers.amd.com/drivers/linux/amdgpu-pro-20.50-1234664-ubuntu-20.04.tar.xz
```

## extract archive
 ```sh
tar -xf amdgpu-pro-20.50-1234664-ubuntu-20.04.tar.xz
```

## install drivers
 ```sh
cd amdgpu-pro-20.50-1234664-ubuntu-20.04/
./amdgpu-pro-install -y --opencl=rocr,legacy,rocm --headless
```

## add user to video and render group
 ```sh
sudo usermod -a -G video $LOGNAME
sudo usermod -a -G render $LOGNAME
```

## add any future users to video and render group
 ```sh
echo 'ADD_EXTRA_GROUPS=1' | sudo tee -a /etc/adduser.conf
echo 'EXTRA_GROUPS=video' | sudo tee -a /etc/adduser.conf
echo 'EXTRA_GROUPS=render' | sudo tee -a /etc/adduser.conf
```

## Add amdgpu-pro PATH
add the following to ~/.bashrc:
Export PATH="/opt/amdgpu-pro/bin:$PATH"

You can edit using nano:

 ```sh
nano ~/.bashrc
```

Save by pressing:
ctrl+x
y
ENTER

 ```sh
source ~/.bashrc
```

Sources:
https://www.amd.com/en/support/kb/release-notes/rn-amdgpu-unified-linux-20-45
https://www.amd.com/en/support/kb/release-notes/rn-amdgpu-unified-linux-20-50
https://www.blog.albertbling.com/posts/how-to-mine-ethereum-on-linux/ (Great guide!)
