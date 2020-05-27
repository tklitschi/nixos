{ pkgs, ... }:
{
  imports = [ 
    ../modules/sshd.nix
    /etc/tinc/cdark.net/default.nix
    ../home    
    {
      cdark_net = {
        enable = true;
        hostName = "litschi_guide";
        hostsDirectory = /etc/tinc/cdark.net/hosts;
        ed25519PrivateKeyFile = "/etc/tinc/cdark.net/ed25519_key.priv"; 
        ip4address = "172.20.71.9";
        ip6address = "fd23:42:cda:2000::5";
      };
    }

  ];

  services.netdata.enable = true;


}
