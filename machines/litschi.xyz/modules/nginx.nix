{ config, ... }:
{
  security.acme.acceptTerms = true;
  security.acme.email = "t.kratz@posteo.de";
  security.acme.certs = {
    "litschi.xyz" = {
      group = "matrix-synapse";
      allowKeysForGroup = true;
      extraDomains = {
        "matrix.litschi.xyz" = null;
      };
      postRun = "systemctl reload nginx.service; systemctl restart matrix-synapse.service";
    };

    "matrix.litschi.xyz" = {
      group = "matrix-synapse";
      allowKeysForGroup = true;
      extraDomains = {
        "litschi.xyz" = null;
      };
      postRun = "systemctl reload nginx.service; systemctl restart matrix-synapse.service";
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
        locations."/" = {
          proxyPass = "http://116.203.127.46:9001";
	      proxyWebsockets = true;
        };
      };
  
      "stats.litschi.xyz" = {
	forceSSL = true;
        enableACME = true;
        locations."/" = {
          proxyPass = "http://localhost:3000";
	  proxyWebsockets = true;
        };
      };
      
      "matrix.litschi.xyz" = {
        forceSSL = true;
        enableACME = true;
        locations = {
          "/.well-known/matrix/server" = {
            extraConfig = ''
              default_type application/json;
              return 200 "{\"m.server\": \"litschi.xyz\"}";
            '';
          };
          "/" = {
            proxyPass = "http://127.0.0.1:8008";
          };
        };

      }; 
     
     "litschi.xyz" = {
	addSSL = true;
        enableACME = true;
        locations = {
          "/" = {
            proxyPass = "http://127.0.0.1:8008";
          };
        };
     };
  };
};
}
