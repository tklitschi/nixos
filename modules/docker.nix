{ pkgs, ... }:
{
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;  
    enableNvidia = true;
  };
}
