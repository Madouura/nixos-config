{
  # system.copySystemConfiguration = true;

  nix = {
    autoOptimiseStore = true;
    settings.experimental-features = [ "nix-command" "flakes" ];

    trustedUsers = [
      "root"
      "@wheel"
    ];

    gc = {
      automatic = true;
      options = "--delete-older-than 8d";
    };
  };
}
