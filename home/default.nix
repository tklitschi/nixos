{pkgs, config, lib, ... }:
{
  imports = [
    <home-manager/nixos>
  ];

  home-manager.useGlobalPkgs = true;
  home-manager.users.tk = { ... }: {
    services.blueman-applet.enable = true;
    services.network-manager-applet.enable = true;
    
    imports = [
      ./programs/ssh.nix
      ./programs/vim.nix
      ./programs/kitty.nix

      ./services/i3.nix
      ./services/dunst.nix 
    ];

    gtk = {
      enable = true;
      font = {
        package = pkgs.jetbrains-mono;
        name = "JetBrainsMono 8";
      };
      theme = {
        package = pkgs.nordic;
        name = "Nordic";
      };
      iconTheme = {
            name = "Qogir-dark";
            package = pkgs.qogir-icon-theme;
      };
      gtk3.extraConfig = {
        gtk-cursor-theme-size=24;
        gtk-toolbar-style="GTK_TOOLBAR_BOTH_HORIZ";
        gtk-toolbar-icon-size="GTK_ICON_SIZE_LARGE_TOOLBAR";
        gtk-button-images=0;
        gtk-menu-images=0;
        gtk-enable-event-sounds=1;
        gtk-enable-input-feedback-sounds=0;
        gtk-xft-antialias=1;
        gtk-xft-hinting=1;
        gtk-xft-hintstyle="hintslight";
        gtk-xft-rgba="rgb";
        gtk-cursor-theme-name="Adwaita";
        gtk-application-prefer-dark-theme=0;
      };
      gtk2.extraConfig = ''
        gtk-cursor-theme-name="Adwaita"
        gtk-cursor-theme-size=24
        gtk-toolbar-style=GTK_TOOLBAR_BOTH_HORIZ
        gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
        gtk-button-images=0
        gtk-menu-images=0
        gtk-enable-event-sounds=1
        gtk-enable-input-feedback-sounds=0
        gtk-xft-antialias=1
        gtk-xft-hinting=1
        gtk-xft-hintstyle="hintslight"
        gtk-xft-rgba="rgb"
      '';
    };
  };
}
