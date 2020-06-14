{ pkgs, lib, config, ... }:
{
  home.keyboard.layout = "de";

  xsession = {
    enable = true;
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      
      config = {
        bars = [ 
          { 
            statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs /etc/nixos/home/nixdot/.config/i3status-rust/${(import /etc/nixos/hostname.nix).hostName}.toml"; #${config.networking.hostName}${.i3status-rs-config} #/etc/nixos/home/nixdot/.config/i3status-rust/${networking.hostName}.toml
            fonts = [ "JetBrainsMono Nerd Font 8" ]; 
            colors = {
              separator = "#666666";
              background = "#444444";
              statusline = "#dddddd";
              focusedWorkspace = { background = "#0088CC"; border = "#0088CC"; text = "#ffffff"; };
              activeWorkspace = { background = "#333333"; border = "#333333"; text = "#ffffff"; };
              inactiveWorkspace = { background = "#333333"; border = "#333333"; text = "#888888"; };
              urgentWorkspace = { background = "#2f343a"; border = "#900000"; text = "#ffffff"; };
            };
          }
        ];
        floating = {
          border = 1;
          modifier = "Mod4";
          criteria = [
            { title = "Steam - News.*"; }
            { title = "feh"; }
            { class = "Pavucontrol"; }
          ];
        };
        fonts = [ "JetBrainsMono 8" "Nerd Font 8" ];
        gaps = {
          inner = 10;
          smartBorders = "on";
          smartGaps = true;
        };
        keybindings = let mod = config.xsession.windowManager.i3.config.modifier; in lib.mkOptionDefault {
          "${mod}+Return" = "exec kitty";
          "${mod}+q" = "kill";
          "${mod}+d" = "exec ${pkgs.bash}/bin/bash /etc/nixos/home/nixdot/.config/rofi-menus/appsmenu.sh";
          "${mod}+i" = "exec ${pkgs.bash}/bin/bash /etc/nixos/home/nixdot/.config/rofi-menus/i3keybindingsmenu.sh";
          "${mod}+o" = "exec ${pkgs.bash}/bin/bash /etc/nixos/home/nixdot/.config/rofi-menus/powermenu.sh";
          "${mod}+Shift+s" = "exec ${pkgs.bash}/bin/bash /etc/nixos/home/nixdot/.config/rofi-menus/scrotmenu.sh";
          "${mod}+Shift+m" = "exec ${pkgs.bash}/bin/bash /etc/nixos/home/nixdot/.config/rofi-menus/mpdmenu.sh";
          "${mod}+c" = "exec ${pkgs.chromium}/bin/chromium";
          "${mod}+n" = "exec ${pkgs.gnome3.nautilus}/bin/nautilus";
          "${mod}+p" = "exec ${pkgs.betterlockscreen}/bin/betterlockscreen --lock";
          "${mod}+g" = "gaps inner current plus 5";
          "${mod}+Shift+g" = "gaps inner current minus 5";
          # "${mod}+" = "exec ";
          # "${mod}+" = "exec ";
          # "${mod}+" = "exec ";
          # "${mod}+" = "exec ";
          # "${mod}+" = "exec ";
          # "${mod}+" = "exec ";
          # "${mod}+" = "exec ";
          
          "${mod}+Shift+c" = "reload";
          "${mod}+Shift+r" = "restart";
          "${mod}+s" = "layout stacking";
          "${mod}+w" = "layout tabbed";
          "${mod}+e" = "layout toggle split";
          "${mod}+r" = "mode resize";

          "${mod}+f" = "fullscreen toggle";
          "${mod}+Shift+space" = "floating toggle";

          "${mod}+Left" = "focus left";
          "${mod}+Down" = "focus down";
          "${mod}+Up" = "focus up";
          "${mod}+Right" = "focus right";

          "${mod}+Shift+Left" = "move left";
          "${mod}+Shift+Down" = "move down";
          "${mod}+Shift+Up" = "move up";
          "${mod}+Shift+Right" = "move right";

          "${mod}+v" = "split v";
          "${mod}+h" = "split h";

          "${mod}+1" = "workspace 1";
          "${mod}+2" = "workspace 2";
          "${mod}+3" = "workspace 3";
          "${mod}+4" = "workspace 4";
          "${mod}+5" = "workspace 5";
          "${mod}+6" = "workspace 6";
          "${mod}+7" = "workspace 7";
          "${mod}+8" = "workspace 8";
          "${mod}+9" = "workspace 9";
          "${mod}+0" = "workspace 10";

          "${mod}+Shift+1" = "move container to workspace 1";
          "${mod}+Shift+2" = "move container to workspace 2";
          "${mod}+Shift+3" = "move container to workspace 3";
          "${mod}+Shift+4" = "move container to workspace 4";
          "${mod}+Shift+5" = "move container to workspace 5";
          "${mod}+Shift+6" = "move container to workspace 6";
          "${mod}+Shift+7" = "move container to workspace 7";
          "${mod}+Shift+8" = "move container to workspace 8";
          "${mod}+Shift+9" = "move container to workspace 9";
          "${mod}+Shift+0" = "move container to workspace 10";

          # brightness
          XF86MonBrightnessDown = "exec ${pkgs.brightnessctl}/bin/brightnessctl -q s 5%-";
          XF86MonBrightnessUp = "exec ${pkgs.brightnessctl}/bin/brightnessctl -q s 5%+";

          # volume
          XF86AudioRaiseVolume = "exec ${pkgs.ponymix}/bin/ponymix increase 5";
          XF86AudioLowerVolume = "exec ${pkgs.ponymix}/bin/ponymix decrease 5";
          XF86AudioMute = "exec ${pkgs.ponymix}/bin/ponymix toggle";

          # media
          XF86AudioPlay = "exec ${pkgs.playerctl}/bin/playerctl play-pause";
          XF86AudioPause = "exec ${pkgs.playerctl}/bin/playerctl pause";
          XF86AudioNext = "exec ${pkgs.playerctl}/bin/playerctl next";
          XF86AudioPrev = "exec ${pkgs.playerctl}/bin/playerctl previous";
        };
        menu = "${pkgs.rofi-unwrapped}/bin/rofi";
        modes = {
          resize = { 
            Down = "resize grow height 10 px or 10 ppt"; 
            Left = "resize shrink width 10 px or 10 ppt"; 
            Right = "resize grow width 10 px or 10 ppt"; 
            Up = "resize shrink height 10 px or 10 ppt"; 

            Return = "mode default";
            Escape = "mode default"; 
            "${config.xsession.windowManager.i3.config.modifier}+r" = "mode default";
          };
        };
        startup = [
          {command = "mpDris2";}
          {command = "feh --bg-fill /etc/nixos/home/nixdot/.config/wallpaper.png"; always = true;}
        ];
        terminal = "kitty";
        modifier = "Mod4";
        workspaceAutoBackAndForth = true;
      };
    };
  };
}
