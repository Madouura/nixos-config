let
  allSystems = builtins.attrValues systems;
  allUsers = builtins.attrValues systems users;

  systems = {
    ura = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF0RbxdF5/3E7DKg8B4btl/dF9e/HEb7fiFhQerdiPks root@ura";
  };

  users = {
    mado_ura = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBu7wSwPYmUqC4BkrUep6n1YdFicY1WjMLzR/TXGxkbY mado@ura";
  };
in {
  "ura_monitors.xml.age".publicKeys = with systems; [ ura ];
  "mado_ura_git_email.inc.age".publicKeys = with users; [ mado_ura ];
}
