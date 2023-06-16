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
        4010
      ];

      allowedUDPPorts = [
        4010
      ];
    };

    interfaces = {
      enp5s0.useDHCP = true;
      enp6s0.useDHCP = true;
      wlp7s0.useDHCP = true;
    };
  };
}
