{ pkgs, ... }:
{
  services.prometheus = {
    enable = true;
    scrapeConfigs = [
      #{
      #  job_name = "router.litschi.xyz";
      #  scrape_interval = "10s";
      #  static_configs = [
      #    {
      #      targets = [
      #        "192.168.1.1:9100"
      #      ];
      #      labels = {
      #        alias = "router.litschi.xyz";
      #      };
      #    }
      #  ];
      #}
      {
        job_name = "eddi.litschi.xyz";
        scrape_interval = "10s";
        static_configs = [
          {
            targets = [
              "172.20.71.6:9100"
            ];
            labels = {
              alias = "eddi.litschi.xyz";
            };
          }
        ];
      }
      {
        job_name = "zaphod.litschi.xyz";
        scrape_interval = "10s";
        static_configs = [
          {
            targets = [
              "172.20.71.7:9100"
            ];
            labels = {
              alias = "zaphod.litschi.xyz";
            };
          }
        ];
      }
    ];
  };

  services.prometheus.exporters = {
    node = {
      enable = true;
      listenAddress = "0.0.0.0";
      enabledCollectors = [
        "cpu"
        "cpufreq"
        "diskstats"
        "pressure"
        "logind"
        "systemd"
        "netstat"
      ];
      firewallFilter = "-p tcp -m tcp --dport 9100";
      openFirewall = true;
    };
  };
}