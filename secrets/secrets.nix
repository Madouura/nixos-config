let
  allSystems = builtins.attrValues systems;

  systems = {
    ura = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKcY4WL6nnFZ6IZGWLqyqlDTcysVG9qPRtGY/YxyYGyA root@ura";
  };
in {
  "avatar.jpg.age".publicKeys = allSystems;
  "gdm.age".publicKeys = allSystems;
  "ura_monitors.xml.age".publicKeys = allSystems;
}
