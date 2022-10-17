let
  systems = {
    ura = "ssh-ed25519 (insert pubkey here)";
    tsuki = "ssh-ed25519 (insert pubkey here)";
  };

  users = {
    mado-ura = "ssh-ed25519 (insert pubkey here)";
    mado-tsuki = "ssh-ed25519 (insert pubkey here)";
  };

  allUsers = builtins.attrValues users;
  allSystems = builtins.attrValues systems;
in {
  "(insert secret here).age".publicKeys = allUsers ++ [ systems.tsuki systems.ura ];
}
