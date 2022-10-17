let
  systems = {
    ura = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILnqdwKizr8TzIIoJUMUyE7DGdtbpZjrBjvr+1J1p+Mh root@ura";
    tsuki = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOSID66VGITM+qDNHJxJuPPkow0pZwJcg118S6EuWvRT root@tsuki";
  };

  users = {
    mado-ura = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKPGhvRsUC8JTMk72PoW2bW0IzRykOF30SLDQ5Vx8fDJ mado@ura";
    mado-tsuki = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG1HwfqoYwv92oJbIHHAKx+6S2ppCSxS58XggddZiv8A mado@tsuki";
  };

  allUsers = builtins.attrValues users;
  allSystems = builtins.attrValues systems;
in {
  "avatar.png.age".publicKeys = allUsers ++ [ systems.tsuki systems.ura ];
  "gdm.age".publicKeys = allUsers ++ [ systems.tsuki systems.ura ];
  "monero_pubaddr.age".publicKeys = allUsers ++ [ systems.tsuki systems.ura ];
  "ura_monitors.xml.age".publicKeys = allUsers ++ [ systems.ura ];
}
