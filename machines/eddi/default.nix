{ pkgs, config, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware.nix
      ./samba.nix
      ./nginx.nix
      ./monitoring.nix
      ../../roles/all.nix
      ../../roles/workstation.nix
      #../../roles/server.nix
      ../../users/tk.nix
    ];

  security.duosec.motd = true;

  networking = {
    useDHCP = false;
    interfaces.enp0s31f6 = {
      useDHCP = false;
    };
    hostName = "eddi";
  };

  boot.plymouth.enable = true;
  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  nixpkgs.config.allowUnfree = true;
  
  services.openssh.passwordAuthentication = false;

  #services.printing.enable = true;
  #services.printing.browsing = true;

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.autoUpgrade.enable = true;
  #system.autoUpgrade.channel = https://nixos.org/channels/nixos-unstable;

  system.stateVersion = "19.09"; # Did you read the comment?

}
