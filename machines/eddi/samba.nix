{ pkgs, config, ... }:

{
    services.samba = {
        enable = true;
        securityType = "user";
        #package = pkgs.sambaMaster;
        extraConfig = ''
            workgroup = WORKGROUP
            server string = nixzusehen
            netbios name = nixzusehen
            security = user 
            #use sendfile = yes
            #max protocol = smb2
            hosts allow = 192.168.8.0/24  localhost  
            #hosts deny = 0.0.0.0/0
            guest account = nobody
            map to guest = bad user
        '';
        shares = {
            backup = {
                path = "/mnt2/backup";
                browseable = "yes";
                "read only" = "no";
                "guest ok" = "no";
                "create mask" = "0644";
                "directory mask" = "0755";
                "force user" = "tk";
                "force group" = "users";
            };
            public = {
                path = "/mnt2/Public";
                browseable = "yes";
                "read only" = "no";
                "guest ok" = "yes";
                "create mask" = "0644";
                "directory mask" = "0755";
                "force user" = "tk";
                "force group" = "users";
            };
            private = {
                path = "/mnt2";
                browseable = "yes";
                "read only" = "no";
                "guest ok" = "no";
                "create mask" = "0644";
                "directory mask" = "0755";
                "force user" = "tk";
                "force group" = "users";
            };
        };
    };
    networking.firewall.allowedTCPPorts = [ 445 139 ];
    networking.firewall.allowedUDPPorts = [ 137 138 ];    
}
