![NixOS Logo](https://www.google.com/url?sa=i&url=https%3A%2F%2Fgithub.com%2FNixOS%2Fnixos-artwork%2Fissues%2F16&psig=AOvVaw0BNax0ujYt8FUtoR4mGOVW&ust=1590666425887000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCODJ4rD80-kCFQAAAAAdAAAAABAJ)

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


