{ inputs, ... }: {
  nix = {
    nixPath = [ "/etc/nix/path" ];

    registry = {
      nixpkgs.flake = inputs.nixpkgs;
      nixpkgs-unstable.flake = inputs.nixpkgs-unstable;
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
