{
  nix = {
    trustedUsers = [ "mado" ];

    extraOptions = ''
      keep-outputs = true
      keep-derivations = true
    '';
  };

  users.users.mado = {
    isNormalUser = true;
    description = "Madoura";
    extraGroups = [ "wheel" ];
  };
}
