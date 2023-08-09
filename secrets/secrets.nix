let
  allSystems = builtins.attrValues systems;

  systems = {
    ura = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF0RbxdF5/3E7DKg8B4btl/dF9e/HEb7fiFhQerdiPks root@ura";
  };
in {
  "ura_monitors.xml.age".publicKeys = allSystems;
}
