{
  networking = {
    hostName = "ura";
    networkmanager.enable = true;

    firewall = {
      allowedTCPPortRanges = [
        { from = 13370; to = 13379; } # Standard
        { from = 13380; to = 13389; } # Windows VM
      ];

      allowedUDPPortRanges = [
        { from = 13370; to = 13379; } # Standard
        { from = 13380; to = 13389; } # Windows VM
      ];

      allowedTCPPorts = [
        18080 # Monero
      ];

      allowedUDPPorts = [
        18080 # Monero
      ];
    };

    interfaces = {
      enp5s0.useDHCP = true;
      enp6s0.useDHCP = true;
      wlp7s0.useDHCP = true;
    };

    hosts = {
      # Genshin Impact bypass for lutris
      "0.0.0.0" = [
        "sg-public-data-api.hoyoverse.com"
        "log-upload-os.hoyoverse.com"
        "overseauspider.yuanshen.com"
        "public-data-api.mihoyo.com"
        "log-upload.mihoyo.com"
        "uspider.yuanshen.com"
      ];
    };
  };
}
