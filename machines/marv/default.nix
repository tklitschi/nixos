{ pkgs, config, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware.nix
      #./firewall.nix
      ../../roles/all.nix
      ../../modules/fonts.nix
      ../../roles/server.nix
      ../../users/tk.nix
      #./wireguard.nix

    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";
  boot.plymouth.enable = true;


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
    useDHCP = true;
    hostName = "marv";
    firewall = {
      allowedTCPPorts = [ ];
      allowedUDPPorts = [ ];
    };
  };
 

  services.openssh = {
      allowSFTP = true;
  };

  environment.systemPackages = with pkgs; [
    bash
    deluge
    exiftool
    gotop
    magic-wormhole
    mediainfo
    neofetch
    networkmanager
    ranger
    scrot
    xclip
    xorg.xkill
    curl
    efibootmgr
    efitools
    efivar
    feh
    file
    fzf
    fd
    gitAndTools.gitFull
    gitAndTools.tig
    gitAndTools.transcrypt
    gcc
    gnumake
    htop
    mtr
    openssl
    picocom
    powertop
    sbsigntool
    tinc
    tinc_pre
    tcpdump
    usbutils
    vim
    pkgs.wireguard 
    php72
    php72-embed
    php72-unit
    pkgs.wireguard-tools
    ripgrep
    wget
    weechat
    whois
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
