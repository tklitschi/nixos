{ pkgs, ... }:
{
  imports = [ 
    ../modules/audio.nix
    ../modules/mpd.nix
    ../modules/fonts.nix
    ../modules/pkgs.nix
    ../modules/sshd.nix
    ../modules/yubikey.nix
    #../modules/borgbackup.nix
    /etc/tinc/cdark.net/default.nix
    ../home


    {
      cdark_net = {
        enable = true;
        hostName = "litschi_zaphod";
        hostsDirectory = /etc/tinc/cdark.net/hosts;
        ed25519PrivateKeyFile = "/etc/tinc/cdark.net/ed25519_key.priv"; 
        ip4address = "172.20.71.7";
        ip6address = "fd23:42:cda:2000::0003";
      };
    }
  ];

  nix.trustedUsers = [ "root" "tk" ];

  hardware.cpu.intel.updateMicrocode = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.networkmanager = {
    enable = true;
    dns = "unbound";
    ethernet.macAddress = "random";
    wifi.macAddress = "random";
    unmanaged = [ "interface-name:docker0;veth*" ];
  };

  hardware.opengl.driSupport32Bit = true;

  programs.light.enable = true;
  
  services = {
    xserver = {
      enable = true;
      layout = "de";
      xkbOptions = "compose:caps";
      libinput.enable = true;
      videoDrivers = [ "intel" ]; # intel

      desktopManager.gnome3.enable = true;
      desktopManager.xterm.enable = false;
      displayManager.gdm = {
        enable = true;
        autoLogin.user = "tk";
        autoLogin.enable = true;
      };

      windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;
      };

    };

    autorandr.enable = true;
  };
  
  nixpkgs.config = {
  packageOverrides = pkgs: rec {
    polybar = pkgs.polybar.override {
      i3Support = true;
    };
  };
};

  services.gvfs.enable = true;

  nixpkgs.overlays = [
    (self: super: {
        ate = self.callPackage ../modules/ate.nix {};
    })
  ];
  environment.systemPackages = with pkgs; [
    libinput-gestures
    ate
  ];

  services.prometheus.exporters = {
    node = {
      enable = true;
      listenAddress = "0.0.0.0";
      enabledCollectors = [
        "cpu"
        "cpufreq"
        "diskstats"
        "pressure"
        "logind"
        "systemd"
        "netstat"
      ];
      firewallFilter = "-p tcp -m tcp --dport 9100";
      openFirewall = true;
    };
  };
}

