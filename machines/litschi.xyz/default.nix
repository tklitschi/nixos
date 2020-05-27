{ pkgs, config, ... }:
let
  unstable = import <nixos-unstable> { config.allowUnfree = true; };
in {
  imports =
    [ # Include the results of the hardware scan.
      ./hardware.nix
      ./modules/weechat.nix
      ./modules/pkgs.nix
      ./modules/nginx.nix
      ./modules/monitoring.nix
      ../../roles/all.nix
      #../../modules/borgbackup.nix
      ../../roles/server.nix
      ../../users/tk.nix

    ];

  virtualisation.docker.enable = true; 

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";

  documentation.enable = false;
  documentation.man.enable = false;
  documentation.doc.enable = false;

  system.autoUpgrade.enable = true;
  nix.gc.automatic = true;
  nix.optimise.automatic = true;

  programs.mtr.enable = true;
  programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
  };

  security.duosec.motd = true;
  nix.trustedUsers = [ "root" "tk" ];


  networking = {
   #  useDHCP = true;
    hostName = "the-guide";
    firewall = {
      allowedTCPPorts = [ 80 20917 19999 9100 9090 443 9987 6600 3389 1 8080 9001 3000 9090 9100 ];
      allowedUDPPorts = [ 20917 9987 ];
    };
  };
 
  services.openssh = {
      allowSFTP = true;
  };

  environment.systemPackages = with pkgs; [
    
  ];

  #boot.loader.systemd-boot.enable = true;
  #boot.loader.efi.canTouchEfiVariables = true;
  #nixpkgs.config.allowUnfree = true;

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?

}
