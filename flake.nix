{
  description = "Madouura's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-22.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager/release-22.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence.url = "github:nix-community/impermanence";
    agenix.url = "github:ryantm/agenix";
    flake-utils.url = "github:numtide/flake-utils";

    utils = {
      url = "github:gytis-ivaskevicius/flake-utils-plus";
      inputs.flake-utils.follows = "flake-utils";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    nixos-hardware,
    home-manager,
    impermanence,
    agenix,
    flake-utils,
    utils
  } @inputs: {
    nixosConfigurations = {
      ura = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          (import ./hosts/ura/configuration.nix)
          utils.nixosModules.autoGenFromInputs
          home-manager.nixosModules.home-manager
          agenix.nixosModules.age
          impermanence.nixosModule

          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users = import ./users;

              extraSpecialArgs = {
                inherit inputs;
                desktop = true;
              };
            };
          }
        ];

        specialArgs = { inherit inputs; };
      };

      tsuki = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          (import ./hosts/tsuki/configuration.nix)
          utils.nixosModules.autoGenFromInputs
          home-manager.nixosModules.home-manager
          agenix.nixosModules.age
          impermanence.nixosModule

          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users = import ./users;

              extraSpecialArgs = {
                inherit inputs;
                desktop = false;
              };
            };
          }
        ];

        specialArgs = { inherit inputs; };
      };
    };
  };
}
