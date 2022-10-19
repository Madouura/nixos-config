{
  description = "Madouura's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-22.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware";
    nix-user-repository.url = "github:nix-community/NUR";

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
    nix-user-repository,
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
        # modules = [ ./hosts/machines/ura ];
        modules = [ ./hosts/machines/ura home-manager.nixosModules.home-manager
{ home-manager = {
useGlobalPkgs = true; useUserPackages = true; users.mado = import ./home/machines/ura/mado.nix; extraSpecialArgs = { inherit inputs; }; 
}; } ];
        specialArgs = { inherit inputs; };
      };

      # Laptop
      tsuki = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ /hosts/machines/tsuki ];
        specialArgs = { inherit inputs; };
      };
    };

    homeConfigurations = {
      # Desktop
      "mado@ura" = home-manager.lib.homeManagerConfiguration {
        system = "x86_64-linux";
        modules = [ ./home/machines/ura/mado.nix ];
        specialArgs = { inherit inputs; };
      };

      # Laptop
      "mado@tsuki" = home-manager.lib.homeManagerConfiguration {
        system = "x86_64-linux";
        modules = [ ./home/machines/tsuki/mado.nix ];
        specialArgs = { inherit inputs; };
      };
    };
  };
}
