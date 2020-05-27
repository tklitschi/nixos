![NixOS Logo](https://camo.githubusercontent.com/e18a77abf36b84656ddaa1e79fed706c9d3e8cfd/68747470733a2f2f6e69786f732e6f72672f6c6f676f2f6e69786f732d68697265732e706e67)

To run my NixOS config, execute the following:

> sudo mv /etc/nixos /etc/nixos.bak
> 
> sudo git clone https://github.com/tklitschi/nixos.git /etc/nixos
> 
> sudo cp /etc/nixos.bak/hardware-configuration.nix /etc/nixos/$machine/hardware.nix
> 
> sudo ln -sr /etc/nixos/machines/$MACHINE/configuration.nix /etc/nixos/configuration.nix

TODO:

    - [ ] change commands and links to varibales
    - [ ] insert https://github.com/tklitschi/nixdot to NixOS Config
    - [ ] Ricing all the Time

## dotfiles
You can find the config files for e.g. i3 in my nixdot rep (https://github.com/tklitschi/nixdot).

## contribution 
A lot of this is is inspired by other People, so feel free to read this and get inspired too :grinning:	

But: NOTE THAT THIS IS MY PERSONAL CONFIG, SO WHEN ADOPTING PARTS OF IT MAKE SURE TO UNDERSTAND WHAT YOU ARE DOING. IN PARTICULAR, DO NOT USE MY PUBLIC SSH KEY FOR ROOT AND USER ACCESS.


