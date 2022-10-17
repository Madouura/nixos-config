{
  networking = {
    hostName = "ura";
    networkmanager.enable = true;
    useDHCP = false;

    firewall = {
      allowedTCPPortRanges = [
        { from = 13370; to = 13379; }
        { from = 13380; to = 13389; }
      ];

      allowedUDPPortRanges = [
        { from = 13370; to = 13379; }
        { from = 13380; to = 13389; }
      ];
    };

    interfaces = {
      enp5s0.useDHCP = true;
      enp6s0.useDHCP = true;
      wlp7s0.useDHCP = true;
    };
  };
}
