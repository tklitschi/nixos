# Driver support, etc for Yubikeys
{ config, pkgs, ... }:

{
  hardware.u2f.enable = true;

  environment.systemPackages = with pkgs; [
    opensc pcsctools libu2f-host yubikey-personalization yubikey-manager yubikey-manager-qt
    (openvpn.override { pkcs11Support = true; })
  ];
  services.pcscd.enable = true;
  services.udev.packages = [
    pkgs.yubikey-personalization
  ];
}
