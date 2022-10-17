{
  nix = {
    autoOptimiseStore = true;

    gc = {
      automatic = true;
      options = "--delete-older-than 8d";
    };
  };
}
