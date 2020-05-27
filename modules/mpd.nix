{ config, ... }:
{
  services = {
    avahi = {
        enable = true;
        hostName = "eddi";
        nssmdns = true;
        publish = {
            enable = true;
            addresses = true;
            userServices = true;
        };
    };
  };

  services.mpd = {
    enable = true;
    network.listenAddress = "any";
    musicDirectory = "/Music";
    extraConfig = ''
      audio_output {
        type "pulse"
        name "Pulseaudio"
        server "localhost"
      }
      
    '';
  };
  users.extraUsers.mpd.extraGroups = [ "audio" ];
}