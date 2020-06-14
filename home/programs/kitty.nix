{ pkgs, ... }:
{
  home.sessionVariables.TERMINAL = "${pkgs.kitty}/bin/kitty";
  programs.kitty = {
    enable = true;
    keybindings = {
      "ctrl+shift+v" = "paste_from_clipboard";
      "ctrl+plus" = "change_font_size all +1.0";
      "ctrl+minus" = "change_font_size all -1.0";
    };
    settings = {
      hide_window_decorations = true;
      copy_on_select = "clipboard";
      strip_trailing_spaces = "always";

      font_size = "10";

      foreground = "#D8DEE9";
      background = "#2E3440";
      background_opacity = "0.9";

      selection_foreground = "#000000";
      selection_background = "#fffacd";

      # black
      color0 = "#3B4252";
      color8 = "#4C566A";

      # red
      color1 = "#BF616A";
      color9 = "#BF616A";

      # green
      color2 = "#A3BE8C";
      color10 = "#A3BE8C";

      # yellow
      color3 = "#EBCB8B";
      color11 = "#EBCB8B";

      # blue
      color4 = "#81A1C1";
      color12 = "#81A1C1";

      # magenta
      color5 = "#B48EAD";
      color13 = "#B48EAD";

      # cyan
      color6 = "#88C0D0";
      color14 = "#8FBCBB";

      color7 = "#E5E9F0";
      color15 = "#ECEFF4";

      editor = "vim";
      shell = "zsh";
    };
  };
}
