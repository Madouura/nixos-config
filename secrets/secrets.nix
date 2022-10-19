let
  allSystems = builtins.attrValues systems;
  allUsers = builtins.attrValues users;

  systems = {
    ura = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKcY4WL6nnFZ6IZGWLqyqlDTcysVG9qPRtGY/YxyYGyA root@ura";
    tsuki = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOSID66VGITM+qDNHJxJuPPkow0pZwJcg118S6EuWvRT root@tsuki";
  };

  users = {
    mado-ura = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKPGhvRsUC8JTMk72PoW2bW0IzRykOF30SLDQ5Vx8fDJ mado@ura";
    mado-tsuki = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG1HwfqoYwv92oJbIHHAKx+6S2ppCSxS58XggddZiv8A mado@tsuki";
  };
in {
  "avatar.png.age".publicKeys = allSystems ++ allUsers;
  "gdm.age".publicKeys = allSystems ++ allUsers;
  "monero_pubaddr.age".publicKeys = allSystems ++ allUsers;
  "ura_monitors.xml.age".publicKeys = [ systems.ura users.mado-ura ];
}
