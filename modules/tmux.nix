{
  programs.tmux = {
    enable = true;
    terminal = "screen-256color";
    newSession = true;
    shortcut = "f";
    clock24 = true;
     extraConfig= ''
      set -g @plugin "arcticicestudio/nord-tmux"
    '';
  };
}
