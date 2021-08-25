# :hammer_and_pick: PICK-AXE

Toolkit & Package-manager for mining on Linux

:battery: Binaries not included!

![Screenshot of pick-axe HELP menu](https://github.com/nadangergeo/pick-axe/blob/main/screenshots/pick-axe_helpmenu_screenshot.png)

![Screenshot of pick-axe STATUS command](https://github.com/nadangergeo/pick-axe/blob/main/screenshots/pick-axe_status_screenshot.png)

The package manager can install/update the following: trex, gminer, nbminer, ethminer, miniZ...
with more to follow!

By extension, PICK-AXE has support for mining the following coins/algos:
ae, aion, anon, arw, beam, btg, btcz, bze, cash, cfx, ctxc, cuckoo29, equihash125_4, equihash144_5, equihash192_7, equihash210_9, ergo, etc, eth, firo, grimmm, grin31, grin32, ltz, mnx, rvn, safe, sero, tent, vbk, vdl, veil, yec, zano, zcl, zel, zels, zerc

This is *NOT* a yet-another-f*cking*-miner. This is a toolset of a bunch of bash-scripts, which
togheter forms PICK-AXE - a general utility for mining on linux AND somewhat of a package manager for miners.
The idea is to give you control over your mining rig, with simplicity and security in mind.

No "mining fees", except the ones that the miners you select collect.
Read the documenation of a miner before installing it, and *always do your own research*!

## Installation

### Prerequisites & Dependencies

- Linux (Tested and works on Ubuntu 20.04 & 21.04!)
- NVIDIA and/or AMD drivers
- curl
- jq (https://stedolan.github.io/jq/)
- tty-table (via npm) (https://github.com/tecfu/tty-table)

May the force be with you!

### -1. Install Linux
Tested and works on Ubuntu 20.04 & 21.04!
There are plenty of guides out there on how to install Linux.

### 0. Update
Always keep your system up to date!

 ```sh
sudo apt-get -y update && apt-get -y upgrade
```

### 1. Install dependencies (curl, jq, nodejs, npm and tty-table-g)
 ```sh
sudo apt -y install curl
sudo apt -y install jq
sudo apt -y install nodejs
sudo apt -y install npm
sudo npm install tty-table -g
```

### 2. Install Nvidia and/or AMD-drivers

#### NVIDIA
Read /docs/NVIDIA.md

#### AMD
Read /docs/AMD.md

### 3. Install PICK-AXE

 ```sh
wget https://github.com/nadangergeo/pick-axe/archive/refs/tags/0.0.1.tar.gz -O pick-axe-0.0.1.tar.gz
INSTALL_PATH=~/.local/bin
mkdir -p $INSTALL_PATH # Create install target directory if needed
tar -xf pick-axe-0.0.1.tar.gz # Unpack tar
mv pick-axe-0.0.1 $INSTALL_PATH/pick-axe # Move Pick-Axe to ./local/bin
chmod +x $INSTALL_PATH/pick-axe/INSTALL # Give install execution permission 
```

### 4. Add pick-axe to PATH (make it possible to run from any directory)

Now, you have two options. 

### Option 1
You do the following, which will make *all* the commands (bash-scripts) available globally on the system.
As an example, the command "PICK eth", could be run from any directory.

 ```sh
echo >> ~/.bashrc
echo "################ PICK-AXE ##################" >> ~/.bashrc
echo "export PATH=\$PATH:\$HOME/.local/bin/pick-axe" >> ~/.bashrc 
echo "############################################" >> ~/.bashrc
source ~/.bashrc
```

### Option 2
You do the following, which will make the commands (bash-scripts) available globally on the system,
via the "pick-axe" command

As an example, the command "pick-axe PICK eth", could be run from any directory.
so would, the command "pick-axe INSTALL", and same for all other scripts.

As a convinient shorthand, you can also call pick-axe "pax" for short:

"pax PICK eth"

 ```sh
echo >> ~/.bashrc
echo "################ PICK-AXE ##################" >> ~/.bashrc
echo "alias pick-axe=$HOME/.local/bin/pick-axe/index.sh" >> ~/.bashrc 
echo "alias pax=$HOME/.local/bin/pick-axe/index.sh" >> ~/.bashrc 
echo "############################################" >> ~/.bashrc
source ~/.bashrc
```

### 5. Install miner binaries
 ```sh
INSTALL
```
or (depending on what option you chose in STEP 4)

 ```sh
pax INSTALL
```

This will give you a list of options.

 ```sh
INSTALL ethminer
```
or for example:

 ```sh
pax INSTALL trex
```

### 6. Configure wallets and pools
Edit the following file with nano or your text-editor/IDE of choice:
~/.local/bin/pick-axe/config.json

Replace the preconfigured wallets with your own, and configure your pool settings.
This setup will be more streamlined via CLI in the near future!

### 7. Start picking!
![Screenshot of pick-axe pick command](https://github.com/nadangergeo/pick-axe/blob/main/screenshots/pick-axe_pick_screenshot.png)

## Donations
Like this tool? Show some :black_heart:   to this wallet:

**ETH:** 0xC0b1239c2D236DCeC286B75b74e82402C512eb42