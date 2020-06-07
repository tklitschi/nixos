{config, pkgs, ...}:
{
  services.postgresql.enable = true;

  services.matrix-synapse = {
    enable = true;   
    server_name = "litschi.xyz";
    public_baseurl = "https://litschi.xyz/";
    tls_certificate_path = "/var/lib/acme/litschi.xyz/fullchain.pem";
    tls_private_key_path = "/var/lib/acme/litschi.xyz/key.pem";
    account_threepid_delegates = {
      email = "https://vector.im";
      msisdn = "https://vector.im";
    };
    registration_shared_secret = (import ../../../nix-secret/secrets.nix).matrix;
    dataDir = "/mnt/matrix-synapse";
    dynamic_thumbnails = true;
    database_type = "psycopg2";
    database_args = {
      database = "matrix-synapse";
    };
    listeners = [
      { # federation
        bind_address = "0.0.0.0";
        port = 8448;
        resources = [
          { compress = false; names = [ "client" ]; }
          { compress = false; names = [ "federation" ]; }
        ];
        tls = true;
        type = "http";
        x_forwarded = false;
      }
      { # client
        bind_address = "127.0.0.1";
        port = 8008;
        resources = [
          { compress = false; names = [ "client" ]; }
          { compress = false; names = [ "federation" ]; } 
        ];
        tls = false;
        type = "http";
        x_forwarded = true;
      }
    ];

    app_service_config_files = [
      "/var/lib/mautrix-whatsapp/registration.yaml" 
      "/var/lib/mautrix-telegram/registration.yaml"
    ];

    extraConfig = ''
      max_upload_size: "500M"
    '';
  };
  
  environment.systemPackages = with pkgs; [
    mautrix-whatsapp
    mautrix-telegram
  ];

### currently WIP ###  
#  services.mautrix-telegram = {
#        enable = true;
#        environmentFile = /etc/secrets/mautrix-telegram.env; # file containing the appservice and telegram tokens
#        settings = {
#          homeserver = {
#            address = "http://localhost:8008";
#            domain = "litschi.xyz";
#          };
#          appservice = {
#            provisioning.enabled = false;
#            id = "telegram";
#            public = {
#              enabled = true;
#              prefix = "/public";
#              external = "https://matrix.litschi.xyz:8080/public";
#            };
#          };
#          bridge = {
#            relaybot.authless_portals = false;
#            permissions = {
#              "@litschi:litschi.xyz" = "admin";
#            };
#          };
#        };
#  };

}
