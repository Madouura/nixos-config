{
  description = "Madouura's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-23.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware";

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    homeage = {
      url = "github:jordanisaacs/homeage";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fs2-nixpkgs.url = "github:Madouura/nixpkgs/pr/fs2-old-knossos";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    nixos-hardware,
    agenix,
    home-manager,
    homeage,
    fs2-nixpkgs
  } @inputs: let
    supportedSystems = [ "x86_64-linux" ];
    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

    nixpkgsFor = forAllSystems (system: import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    } );

    unstableFor = forAllSystems (system: import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    } );
  in {
    devShells = forAllSystems ( system: let
      pkgs = nixpkgsFor.${ system };
    in {
      default = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          age
          git
          gnumake
          gnupg
        ];
      };
    } );

    nixosConfigurations = {
      # Desktop
      ura = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        pkgs = nixpkgsFor.${system};

        modules = [
          agenix.nixosModules.default
          ./hosts/machines/ura
        ];

        specialArgs = {
          inherit inputs;
          pkgs-unstable = unstableFor.${system};
        };
      };

      # Laptop
      tsuki = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        pkgs = nixpkgsFor.${system};

        modules = [
          agenix.nixosModules.default
          ./hosts/machines/tsuki
        ];

        specialArgs = {
          inherit inputs;
          pkgs-unstable = unstableFor.${system};
        };
      };
    };

    homeConfigurations = {
      # Desktop
      "mado@ura" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgsFor.x86_64-linux;
        modules = [ ./home/machines/ura/mado.nix ];

        extraSpecialArgs = {
          inherit inputs;
          pkgs-unstable = unstableFor.x86_64-linux;
        };
      };

      # Laptop
      "mado@tsuki" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgsFor.x86_64-linux;
        modules = [ ./home/machines/tsuki/mado.nix ];

        extraSpecialArgs = {
          inherit inputs;
          pkgs-unstable = unstableFor.x86_64-linux;
        };
      };
    };
  };
}
