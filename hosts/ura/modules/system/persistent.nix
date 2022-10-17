{
  environment.persistence."/nix/persist" = {
    hideMounts = true;
    files = [ "/etc/machine-id" ];

    directories = [
      "/etc/NetworkManager/system-connections"
      "/etc/nixos"
      "/etc/ssh"
      "/nix/var/nix"
      "/root"
      "/srv"
      { directory = "/var/lib/colord"; user = "colord"; group = "colord"; mode = "0755"; }
      "/var/lib/bluetooth"
      "/var/lib/libvirt"
      { directory = "/var/lib/monero"; user = "monero"; group = "monero"; mode = "0700"; }
      "/var/lib/systemd/coredump"
      { directory = "/var/lib/tor"; user = "tor"; group = "tor"; mode = "0700"; }
      "/var/log"
    ];
  };
}
