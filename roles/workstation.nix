{ pkgs, ... }:
{
  imports = [ 
    ../modules/audio.nix
    ../modules/docker.nix
    ../modules/fonts.nix
    ../modules/pkgs.nix
    ../modules/yubikey.nix
    ../modules/tftpd.nix
    ../modules/sshd.nix
    ../modules/mpd.nix
    ../modules/rdp.nix
    #../modules/borgbackup.nix
    /etc/tinc/cdark.net/default.nix
    #../modules/prometheus.nix
    ../home
    ../overlays


    {
      cdark_net = {
        enable = true;
        hostName = "litschi_eddi";
        hostsDirectory = /etc/tinc/cdark.net/hosts;
        ed25519PrivateKeyFile = "/etc/tinc/cdark.net/ed25519_key.priv"; 
        ip4address = "172.20.71.6";
        ip6address = "fd23:42:cda:2000::2";
      };
    }
  ];

  services.ympd = {
    enable = true;
    webPort = "8081";
  };

  nix.trustedUsers = [ "root" "tk" ];

  hardware.cpu.intel.updateMicrocode = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;
  #boot.kernelParams = [ "amd_iommu=pt" "ivrs_ioapic[32]=00:14.0" "iommu=soft" ];

  networking.dhcpcd.enable = false;
  networking.networkmanager = {
    enable = true;
    dns = "unbound";
    #ethernet.macAddress = "random";
    wifi.macAddress = "random";
    unmanaged = [ "interface-name:docker0;veth*" ];
  };

  system.autoUpgrade.enable = true;
  nix.gc.automatic = true;
  nix.optimise.automatic = true;

  hardware.opengl.driSupport32Bit = true;

  services = {
    plex = {
      enable = true;
      openFirewall = true;
    };
    xserver = {
      enable = true;
      layout = "us";
      xkbOptions = "compose:caps";

      videoDrivers = [ "nvidia" "nv" "vmware"];
      #videoDrivers = [ "vesa" "mesa"  "modesetting" "amdgpu" ];

      desktopManager.gnome3.enable = true;
      desktopManager.xterm.enable = false;
      displayManager.lightdm = {
        enable = true;
      };

      windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;
      };

    };

    autorandr.enable = true;
  };
  services.compton.enable = true;
  services.picom = {
    enable = true;
    backend = "glx";
    vSync = "opengl";
    shadow = true;
  };
  
  nixpkgs.config = {
  packageOverrides = pkgs: rec {
    polybar = pkgs.polybar.override {
      i3Support = true;
    };
  };
};

  services.gvfs.enable = true;

  environment.systemPackages = with pkgs; [
    gitAndTools.git
    # development
    gitAndTools.hub
  ];

  networking.firewall = {
    allowedTCPPorts = [ 19999 53 6660 6600 8080 8081 8083 8086 8088 8123 8443 9090 9103 9130 3000  10011 30033 9987 2300 ];
    allowedUDPPorts = [ 6112 25826  10011 30033 9987 2300 ];
  };
}

