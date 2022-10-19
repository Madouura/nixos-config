{
  environment.persistence."/persist" = {
    hideMounts = true;

    directories = [
      "/etc/NetworkManager/system-connections"
      "/etc/ssh"
      "/var/lib/bluetooth"
      { directory = "/var/lib/colord"; user = "colord"; group = "colord"; mode = "0755"; }
      "/var/lib/libvirt"
      { directory = "/var/lib/monero"; user = "monero"; group = "monero"; mode = "0700"; }
      "/var/lib/systemd/coredump"
      { directory = "/var/lib/tor"; user = "tor"; group = "tor"; mode = "0700"; }
    ];

    files = [
      "/etc/adjtime"
      "/etc/machine-id"
      "/var/lib/NetworkManager/secret_key"
      "/var/lib/NetworkManager/seen-bssids"
      "/var/lib/NetworkManager/timestamps"
    ];
  };
}
