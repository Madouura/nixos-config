let
  allSystems = builtins.attrValues systems;

  systems = {
    ura = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKcY4WL6nnFZ6IZGWLqyqlDTcysVG9qPRtGY/YxyYGyA root@ura";
    tsuki = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOSID66VGITM+qDNHJxJuPPkow0pZwJcg118S6EuWvRT root@tsuki";
  };
in {
  "avatar.png.age".publicKeys = allSystems;
  "gdm.age".publicKeys = allSystems;
  "monero_pubaddr.age".publicKeys = allSystems;
  "ura_monitors.xml.age".publicKeys = [ systems.ura ];
}
