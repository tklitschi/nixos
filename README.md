![NixOS Logo](https://camo.githubusercontent.com/e18a77abf36b84656ddaa1e79fed706c9d3e8cfd/68747470733a2f2f6e69786f732e6f72672f6c6f676f2f6e69786f732d68697265732e706e67)

## Install 
To run my NixOS config, execute the following:

> sudo mv /etc/nixos /etc/nixos.bak
> 
> sudo git clone https://github.com/tklitschi/nixos.git /etc/nixos
> 
> sudo cp /etc/nixos.bak/hardware-configuration.nix /etc/nixos/$machine/hardware.nix
> 
> sudo ln -sr /etc/nixos/machines/$MACHINE/default.nix /etc/nixos/configuration.nix

## TODO:

    - [ ] change commands and links to varibales
    - [ ] insert https://github.com/tklitschi/nixdot to NixOS Config
    - [ ] Ricing all the Time
    - [ ] Home-manager

## dotfiles
You can find the config files for e.g. i3 in my nixdot rep (https://github.com/tklitschi/nixdot).

## Structure
```
.
├── home        \\ Here you can find some of my attemps of to wirte some home-manager config, but mostly not used
│   ├── default.nix 
│   ├── programs
│   │   ├── ssh.nix \\ currently not included
│   │   ├── vim.nix  \\ vim Config for User tk
│   │   └── zsh.nix \\ currently not included
│   └── services
│       ├── i3.nix \\ currently not included
│       └── mpd.nix \\ currently not included
├── machines
│   ├── eddi \\ Desktop Computer and kinda Homeserver   
│   │   ├── default.nix
│   │   ├── hardware.nix
│   │   ├── monitoring.nix \\ prometheus & prometheus node exporter
│   │   ├── nginx.nix \\ nginx config  [WIP]
│   │   └── samba.nix \\ Samba file sharing for Home network
│   ├── litschi.xyz \\ server @hetzner
│   │   ├── default.nix
│   │   ├── hardware.nix
│   │   └── modules
│   │       ├── matr.nix \\ Matrix Server config
│   │       ├── monitoring.nix \\ grafana, prometheus & prometheus node exporter
│   │       ├── nginx.nix \\ nginx config
│   │       ├── pkgs.nix \\ dedicated packages list for Server
│   │       └── weechat.nix \\ Weechat relay
│   ├── marv
│   │   └── default.nix \\ VM Config [WIP] (not in use)
│   └── Zaphod \\ Laptop
│       ├── default.nix
│       ├── hardware.nix
│       └── tmp.nix \\ tempory (kinda TODO)
├── modules \\ special configuration for some Modules 
│   ├── ate.nix \\ Terminal Emulator by @andir
│   ├── audio.nix \\ Audio Setup
│   ├── docker.nix \\ Docker config [WIP]
│   ├── fonts.nix \\ font config    
│   ├── mpd.nix \\ music player deamon config
│   ├── pkgs.nix \\ Package List for Laptop & Computer
│   ├── rdp.nix \\ remote Desktop for Localhost
│   ├── sshd.nix \\ SSH Deamon config
│   ├── tftpd.nix \\ TFTP Deamon config
│   ├── tmux.nix \\ tmux config
│   ├── yubikey.nix \\ Yubikey Config
│   └── zsh.nix \\ Z-Shell config
├── nix-secret \\ Submodule to secret repo to manage secret keys, so this can be public
├── overlays
│   └── powerlevel10k \\ promt for Z-Shell (from mweinelt )
│       ├── default.nix
│       └── pkgs
│           ├── gitstatus.nix
│           ├── romkatv_libgit2.nix
│           └── zsh-powerlevel10k.nix
├── README.md 
├── roles \\ Role config to include some modules easier
│   ├── all.nix
│   ├── laptop.nix
│   ├── server.nix
│   └── workstation.nix
└── users
    ├── root.nix \\ Root User
    └── tk.nix \\ my User

15 directories, 45 files
```
## contribution 
A lot of this is is inspired by other People, so feel free to read this and get inspired too :grinning:	

But: NOTE THAT THIS IS MY PERSONAL CONFIG, SO WHEN ADOPTING PARTS OF IT MAKE SURE TO UNDERSTAND WHAT YOU ARE DOING. IN PARTICULAR, DO NOT USE MY PUBLIC SSH KEY FOR ROOT AND USER ACCESS.


