{ pkgs, ... }:
{
  home.keyboard.layout = "us";

  xsession = {
    enable = true;
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
    };
  };
}
