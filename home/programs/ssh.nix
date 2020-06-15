{ pkgs, ... }:
{
  programs.ssh = {
      extraConfig = "/home/tk/.ssh/config";
      forwardAgent = true;
  };
}
