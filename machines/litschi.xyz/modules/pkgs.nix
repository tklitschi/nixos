{ config, pkgs, ... }:
let
  unstable = import <nixos-unstable> { config.allowUnfree = true; };
in {
  nixpkgs.config.allowUnfree = true;
  #nixpkgs.config.allowBroken = true;
  environment.systemPackages = with pkgs; [
    bash
    deluge
    cryptsetup
    exiftool
    gotop
    magic-wormhole
    mediainfo
    neofetch
    neovim    
    networkmanager
    nodejs-12_x
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
    python3
    php72
    php72-embed
    php72-unit
    pkgs.wireguard-tools
    pfetch
    pwgen
    ripgrep
    wget
    weechat
    whois
    go_bootstrap
    docker
  ];
}
