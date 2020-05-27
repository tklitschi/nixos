{ config, ... }:
{
  security.acme.acceptTerms = true;
  security.acme.email = "t.kratz@posteo.de";
  security.acme.certs = {
    #"eddi.lan" = {
    #  email = "t.kratz@posteo.de";
    #};
  };

  services.nginx = {
    enable = true;

    appendHttpConfig = ''
      limit_req_zone $binary_remote_addr zone=weechat:10m rate=5r/m;
    '';

    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

    virtualHosts = {

      "eddi.lan" = {
	      #forceSSL = true;
        #enableACME = true;
        #root = "/var/lib/litschi.xyz";
        locations."/" = {
          proxyPass = "http://localhost:19999";
	        proxyWebsockets = true;
        };
      };


      };
    };
}
