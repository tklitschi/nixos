{ pkgs, ... }:
{
  services.prometheus = {
    enable = true;
    scrapeConfigs = [
      {
        job_name = "litschi.xyz";
        scrape_interval = "10s";
        static_configs = [
          {
            targets = [
              "localhost:9100"
            ];
            labels = {
              alias = "litschi.xyz";
            };
          }
        ];
      }
    ];
  };

  #services.collectd.enable = true;
  #services.collectd.extraConfig = " LoadPlugin 'logfile'\n LoadPlugin 'network'\n LoadPlugin 'rrdtool'\n <Plugin 'network'>\n Listen '0.0.0.0'\n </Plugin> ";
  
  
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
    #collectd = {
    #  enable = true;
    #  openFirewall = true;
    #  collectdBinary = {
    #    enable = true;
    #    listenAddress = "0.0.0.0";
    #  };
    #};
  };

      
  services.grafana = {
    enable = true;
    domain = "0.0.0.0";
  };
}