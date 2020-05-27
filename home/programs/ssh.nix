{ pkgs, ... }:
{
  programs.ssh = {
      extraConfig = "/home/tk/.ssh/config";
      startAgent = true;
  };
}
