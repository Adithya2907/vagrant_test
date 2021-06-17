# vagrant_test

Used HashiCorp's Vagrant to build a script that deploys a droplet on DigitalOcean, installs necessary dependencies like npm, node, nginx. It also configures Nginx and sets up firewalls. Adds SSH keys to the server, using which it can interact with GitHub, allowing it to clone, and allowing GitHub actions.


## What can be done?
There are two folders inside the 'vagrant' folder. One named deploy, and the other named sync.
The code in the deploy folder simply deploys a droplet on the server, whereas the code inside the sync folder is used to deploy a droplet, and also keep the local machine in sync with a cloud folder.

## How to use this project
Create an environment file in the root directory named '.env'.

The following variables have to be generated and then added:
* DigitalOcean API Token
* Public key of your desktop (optional)
* A public and private key pair which must be added to GitHub also


This starts the process of building the droplet.
```shell
sh shell.sh
```


This deletes the droplet.
```shell
sh destroy.sh
```

## Commands

Note: All these commands must be run from the terminal from inside the proper directory.
Creates a droplet
```shell
sh startup.sh
```


Destroys a droplet
```shell
sh destroy.sh
```


SSHs into the droplet
```shell
sh ssh.sh
```


Resyncs the folder with the server (applied only to the code inside the 'sync' folder)
```shell
sh reload.sh
```

## Disclaimer:
1. This is a stupid project, and may deviate completely from Vagrant's actual purpose, and may actually have very minimal use case. But I had great fun building this, and I learnt a lot about Shell Scripting, SSH, Github Actions, and even a bit of Ruby. Poured over pages and pages of articles, documentation, GitHub issues, blogs, etc.
There exist other solutions like Terraform and Docker too. But since I'm unfamiliar with both, I'll be continuing to use my own script :)

2. All the secret keys and the API keys have been safely deleted.
