{ inputs, ... }: {
  nix = {
    nixPath = [ "/etc/nix/path" ];

    registry = {
      nixpkgs.flake = inputs.nixpkgs;
      active-config.flake = inputs.self;
    };

    settings = {
      auto-optimise-store = true;

      experimental-features = [
        "nix-command"
        "flakes"
      ];

      trusted-users = [
        "root"
        "@wheel"
      ];
    };

    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
  };
}
