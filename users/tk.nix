{ pkgs, ... }:
{
  users.users.tk = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [ "wheel" "audio" "video" "libvirtd" "dialout" "networkmanager" "docker" "mpd" "pulseaudio" "adbusers"];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = (import ../nix-secret/secrets.nix).ssh;
    packages = with pkgs; [
    ];
  };
}
