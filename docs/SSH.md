# How to Install OpenSSH-server (Ubuntu 20.04/21.04)

Open up the terminal on the mining computer.


 ```sh
sudo apt -y install openssh-server
```

Now let's try accessing the ssh-server from *another computer*.
Assuming you are using another linux computer, or say a macbook,
you shoule have ssh built in. You will also need the IP-adress of 
the computer. The local-ip will do to begin with, before having to
manager your router settings.

Open up your terminal (again, on your *other computer*, not the mining machine).

 ```sh
ssh username@ipadressofyourminingmachine
```

You will be prompted for the servers password. Enter it.
If it worked, you will se somthing like this:

 ```console
Welcome to Ubuntu 20.04.3 LTS (GNU/Linux 5.11.0-27-generic x86_64)...
```

Next step is configuring and securing the ssh-server with RSA-keys instead of a regular password.
We will be using nano as our text-editor

 ```sh
sudo nano /etc/ssh/sshd_config
```

Change (line 34) FROM:  
#PermitRootLogin prohibit-password  
TO:  
PermitRootLogin no

Change line 39 FROM:  
#PubkeyAuthentication yes  
TO:  
PubkeyAuthentication yes

Change line 42 FROM:  
#AuthorizedKeysFile     .ssh/authorized_keys .ssh/authorized_keys2  
TO:  
AuthorizedKeysFile     .ssh/authorized_keys

Save by pressing:  
ctrl+x  
y  
ENTER

Now, restart the ssh-server

 ```sh
sudo systemctl restart ssh
```

Next, exit the shell by typing exit (duh!)
 ```sh
exit
```
We are going to generate a new SSH key locally on your computer, using ssh-keygen.

 ```sh
cd ~/.ssh #goto .ssh folder in your home folder
ssh-keygen -f nameofyourkey
```

Now, let's add the key to the mining-computer.

 ```sh
ssh-copy-id -i nameofyourkey username@ipadressofyourminingmachine
```

Sone done, I promise! Try connecting to the mining machine with your new key.

 ```sh
ssh -i nameofyourkey username@ipadressofyourminingmachine
```

Did it work? Cool! One last step now; We need to disable password authentication!
Open up the ssh-config with nano again.


 ```sh
sudo nano /etc/ssh/sshd_config
```

...And edit line 58 and 59 FROM:
#PasswordAuthentication yes
#PermitEmptyPasswords no
TO:
PasswordAuthentication no
PermitEmptyPasswords no

Save by pressing:
ctrl+x
y
ENTER

Restart the ssh-server

 ```sh
sudo systemctl restart ssh
```

Exit, and try connecting with your password, and you will see that it doesn't work anymore.

 ```sh
ssh username@ipadressofyourminingmachine
```

But this still works.

 ```sh
 cd ~/.ssh
ssh -i nameofyourkey username@ipadressofyourminingmachine
```

For even more convinience, let's add the key to the ssh-agent.

 ```sh
cd ~/.ssh
ssh-add nameofyourkey
```
Now you can access your rig like this (without being in the ~/.ssh directory):

 ```sh
ssh username@ipadressofyourminingmachine
```
