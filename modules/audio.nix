{ config, pkgs, lib, ...}:
let
  unstable_pkgs = import <nixos-unstable> {};
in {
  # Enable sound.
  sound.enable = true;
  sound.mediaKeys.enable = true;

  hardware = {
    pulseaudio = {
      enable = true;
      support32Bit = true;
      package = pkgs.pulseaudioFull;
      tcp = {
        enable = true;
        anonymousClients = {
          allowAll = true;
          allowedIpRanges = [ "0.0.0.0" "::0" ];
        };
      };
    };
  };
}
