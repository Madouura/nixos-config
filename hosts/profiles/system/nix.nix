{ inputs, ... }: {
  nix = {
    nixPath = [ "/etc/nix/path" ];

    registry = {
      nixpkgs.flake = inputs.nixpkgs;
      home-manager.flake = inputs.home-manager;
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
      options = "--delete-older-than 8d";
    };
  };

  environment.etc = {
    "nix/path/nixpkgs".source = inputs.nixpkgs;
    "nix/path/home-manager".source = inputs.home-manager;
    "nix/path/activeconfig".source = inputs.self;
  };
}
