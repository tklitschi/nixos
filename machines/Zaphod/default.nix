{ config, pkgs, lib, ...}:
let
  unstable_pkgs = import <nixos-unstable> {};
in {
  imports =
    [ # Include the results of the hardware scan.
      ./hardware.nix
      ../../roles/all.nix
      ../../roles/laptop.nix
      ../../users/tk.nix
      ./tmp.nix

    ];

  hardware  = {
    bluetooth = {
      enable = true;
      package = pkgs.bluezFull;
    };
  };
  systemd.packages = [ pkgs.blueman ];
  services.dbus.packages = [ pkgs.blueman ];

  nixpkgs.overlays = [
    (lib.mkIf (! (import <nixpkgs> {}) ? pulseaudio-modules-bt) (self: super: {
      inherit (unstable_pkgs) pulseaudio-modules-bt;
    }))
  ];


  security.duosec.motd = true;

  networking = {
    useDHCP = false;
    #interfaces.enp57s0u1u2.useDHCP = true;
    interfaces.wlp58s0.useDHCP = true;
    hostName = "zaphod";
  };
  boot.plymouth.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "nodev";
    efiSupport = true;
    enableCryptodisk = true;
  };
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  nixpkgs.config.allowUnfree = true;

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "20.03"; # Did you read the comment? # Yeah, I reinstalled NixOS

  environment.systemPackages = with pkgs; [
    virtmanager
    qemu
    dmg2img
  ];
}