{
  description = "Madouura's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-22.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware";

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-22.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    homeage = {
      url = "github:jordanisaacs/homeage";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    nixos-hardware,
    agenix,
    home-manager,
    homeage
  } @inputs: let
    supportedSystems = [ "x86_64-linux" ];
    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    shellPackages = forAllSystems ( system: import nixpkgs { inherit system; } );
  in {
    devShell = forAllSystems ( system: import ./shell.nix { pkgs = shellPackages.${ system }; } );

    nixosConfigurations = {
      # Desktop
      ura = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./hosts/machines/ura ];
        specialArgs = { inherit inputs; };
      };

      # Laptop
      tsuki = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./hosts/machines/tsuki ];
        specialArgs = { inherit inputs; };
      };
    };

    # 22.11
    # https://git.sr.ht/~misterio/nix-config/tree/main/item/flake.nix
    homeConfigurations = let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      # Desktop
      "mado@ura" = home-manager.lib.homeManagerConfiguration {
        inherit system pkgs;
        stateVersion = "22.05";
        username = "mado";
        homeDirectory = "/home/mado";
        configuration = import ./home/machines/ura/mado.nix { inherit pkgs inputs; };
      };

      # Laptop
      "mado@tsuki" = home-manager.lib.homeManagerConfiguration {
        inherit system pkgs;
        stateVersion = "22.05";
        username = "mado";
        homeDirectory = "/home/mado";
        configuration = import ./home/machines/tsuki/mado.nix { inherit pkgs inputs; };
      };
    };
  };
}
