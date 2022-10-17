{
  environment.persistence."/persistent" = {
    hideMounts = true;

    directories = [
      { directory = "/var/lib/colord"; user = "colord"; group = "colord"; mode = "0755"; }
      "/var/lib/bluetooth"
      "/var/lib/libvirt"
      { directory = "/var/lib/monero"; user = "monero"; group = "monero"; mode = "0700"; }
      "/var/lib/systemd/coredump"
      { directory = "/var/lib/tor"; user = "tor"; group = "tor"; mode = "0700"; }
      "/var/log"
      { directory = "/etc/crypto"; mode = "0700"; }
      "/etc/NetworkManager/system-connections"
    ];

    files = [
      "/etc/machine-id"
    ];
  };
}
