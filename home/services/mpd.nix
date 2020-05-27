{ config, ... }:
{
  services.mpd = {
    enable = true;
    musicDirectory = "${config.home.homeDirectory}/Music";
    network.listenAddress = "any";
    extraConfig = ''
      audio_output {
      	type		"httpd"
      	name		"eddi-music"
      	encoder		"opus"
      	port		"8000"
      	bitrate		"auto"
      	always_on       "yes"
        signal          "music"
      	opustags        "yes"
      }
    '';
  };
}
