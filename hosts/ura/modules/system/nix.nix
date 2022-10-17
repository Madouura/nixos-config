{
  nixpkgs.config.allowUnfree = true;

  nix = {
    generateNixPathFromInputs = true;
    generateRegistryFromInputs = true;
    linkInputs = true;
    trustedUsers = [ "root" "mado" ];
  };
}
