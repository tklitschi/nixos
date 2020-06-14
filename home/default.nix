{ config, lib, ... }:
{
  imports = [
    <home-manager/nixos>
  ];

  home-manager.useGlobalPkgs = true;
  home-manager.users.tk = { ... }: {
    services.blueman-applet.enable = true;
    services.network-manager-applet.enable = true;
    
    imports = [

      ./programs/vim.nix
      ./services/i3.nix 
      ./programs/kitty.nix
    ];
  };
}
