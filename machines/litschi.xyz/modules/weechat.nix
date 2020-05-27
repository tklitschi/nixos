{ config, ... }:
let
  pkgs = import <nixos> {};
  pkg = pkgs.weechat;

  tmuxConf = pkgs.writeText "tmux.conf" ''
     set -g default-terminal "screen-256color"
     set -g status off
  '';
in {
  users = {
    groups.weechat = {
      members = [ "tk" ];
    };
    users.weechat = {
      group = "weechat";
      createHome = true;
      home = "/var/lib/weechat";
      useDefaultShell = true;
      isSystemUser = true;
    };
  };

  systemd.services.weechat = {
    environment.WEECHAT_HOME = "/var/lib/weechat";
    after = [ "network.target "];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      User = "weechat";
      Group = "weechat";
      Type = "forking";
      RemainAfterExit  = "yes";
      ExecStart = "${pkgs.tmux}/bin/tmux -f ${tmuxConf} -S /var/lib/weechat/tmux.session new-session -d -s irc '${pkg}/bin/weechat'";
      ExecStop = "${pkgs.tmux}/bin/tmux -f ${tmuxConf} -S /var/lib/weechat/tmux.session kill-session -t irc";
    };
    postStart = ''
      chmod 660 /var/lib/weechat/tmux.session
      chmod g+rX /var/lib/weechat
    '';
    #reload = ''
    #  echo "*/upgrade -yes ${configuredPkg}/bin/weechat" > /var/lib/weechat/weechat_fifo
    #'';
    #reloadIfChanged = true;
    restartIfChanged = false;
  };
}
