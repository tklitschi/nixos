{ config, ... }:
{
  security.acme.acceptTerms = true;
  security.acme.email = "t.kratz@posteo.de";
  security.acme.certs = {
    "litschi.xyz" = {
      email = "t.kratz@posteo.de";
    };
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
      "chat.litschi.xyz" = {
        forceSSL = true;
        enableACME = true;

        locations."/weechat" = {
          proxyPass = "http://localhost:11000/weechat";
          proxyWebsockets = true;
          extraConfig = ''
            proxy_read_timeout 4h;
            limit_req zone=weechat burst=1 nodelay;
          '';
        };
        locations."/" = {
          proxyPass = "http://localhost";
          #proxyWebsockets = true;
          extraConfig = ''
            proxy_read_timeout 4h;
            
          '';
          #limit_req zone=weechat burst=1 nodelay;
        };
      };
     "pad.litschi.xyz" = {
       forceSSL = true;
        enableACME = true;
        #root = "/var/lib/litschi.xyz";
        locations."/" = {
          proxyPass = "http://116.203.127.46:9001";
	      proxyWebsockets = true;
        };
      };
  
      "stats.litschi.xyz" = {
	forceSSL = true;
        enableACME = true;
        #root = "/var/lib/litschi.xyz";
#basicAuth = {
#	  litschi = "letmein";
#	};
        locations."/" = {
          proxyPass = "http://localhost:3000";
	  proxyWebsockets = true;
        };
      };
      
      "blog.litschi.xyz" = {
	forceSSL = true;
        enableACME = true;
        #root = "/var/lib/litschi.xyz";
        
        locations."/" = {
          proxyPass = "http://78.47.10.102/blog";
	  proxyWebsockets = true;
        };
        locations."/blog" = {
          proxyPass = "http://78.47.10.102/blog";
	  proxyWebsockets = true;
        };
      };


      "litschi.xyz" = {
	addSSL = true;
        enableACME = true;
        #root = "/var/lib/litschi.xyz";
        
        locations."/" = {
          proxyPass = "http://78.47.10.102/blog";
	  proxyWebsockets = true;
        };
        locations."/blog" = {
          proxyPass = "http://78.47.10.102/blog";
	  proxyWebsockets = true;
        };
      };
    };
  };
}
