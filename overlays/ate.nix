{ fetchFromGitHub, callPackage, pkgs, ...}:
callPackage (fetchFromGitHub {
  owner = "andir";
  repo = "ate";
  rev = "49846b79606a3b69f3ca5c98d4776ef34a76dcf8";
  sha256 = "0zcbqvks25sdhbi3v17s3mljcj523q51vd77bp2q4q3pbbr4frva";
}) {
  config.ate = {
    options = {
      # BLACK = "#0c0d0e";
      # RED = "#e31a1c";
      # GREEN = "#31a354";
      # YELLOW = "#dca060";
      # BLUE = "#3182bd";
      # MAGENTA = "#756bb1";
      # CYAN = "#80b1d3";
      # WHITE = "#b7b8b9";
      # BRIGHT_BLACK = "#737475";
      # BRIGHT_RED = "#e31a1c";
      # BRIGHT_GREEN = "#31a354";
      # BRIGHT_YELLOW = "#dca060";
      # BRIGHT_BLUE = "#3182bd";
      # BRIGHT_MAGENTA = "#756bb1";
      # BRIGHT_CYAN = "#80b1d3";
      # BRIGHT_WHITE = "#fcfdfe";
      # FOREGROUND_COLOR = "#e5e1e2";
      # BACKGROUND_COLOR = "#050505";

#NORD

      BLACK = "#3B4252";
      RED = "#BF616A";
      GREEN = "#A3BE8C";
      YELLOW = "#EBCB8B";
      BLUE = "#81A1C1";
      MAGENTA = "#B48EAD";
      CYAN = "#88C0D0";
      WHITE = "#E5E9F0";
      BRIGHT_BLACK = "#4C566A";
      BRIGHT_RED = "#BF616A";
      BRIGHT_GREEN = "#A3BE8C";
      BRIGHT_YELLOW = "#EBCB8B";
      BRIGHT_BLUE = "#81A1C1";
      BRIGHT_MAGENTA = "#B48EAD";
      BRIGHT_CYAN = "#88C0D0";
      BRIGHT_WHITE = "#ECEFF4";
      FOREGROUND_COLOR = "#D8DEE9";
      BACKGROUND_COLOR = "#2E3440";
    };
    keybindings = {
      DECREMENT_FONT = "control+shift+underscore"; # Works like Control+Shift+Minus on qwerty and qwertz
      INCREMENT_FONT = "control+shift+plus";
      PASTE = "control+mod1+y"; # Mod1 == Alt
      PIPECMD = "control+mod1+u";
    };
  };
}
