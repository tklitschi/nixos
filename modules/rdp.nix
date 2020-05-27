{...}:
{
  services.xrdp.enable = true;
  services.xrdp.defaultWindowManager = "i3";
  networking.firewall.allowedTCPPorts = [ 3389 1 ];
}