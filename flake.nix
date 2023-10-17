{
  description = "Madouura's NixOS configuration";

  inputs = {
    # NixOS
    # TODO: Change to 23.11 when it's out
    # nixpkgs.url = "github:nixos/nixpkgs/release-23.11";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    # TODO: Remove later
    nixpkgs-bcachefs.url = "github:Madouura/nixpkgs/pr/bcachefs";
    nixos-hardware.url = "github:NixOS/nixos-hardware";

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
      inputs.darwin.follows = "";
    };

    # Home Manager
    home-manager = {
      # TODO: Change to 23.11 when it's out
      # url = "github:nix-community/home-manager/release-23.11";
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    # TODO: Remove later
    nixpkgs-bcachefs,
    nixos-hardware,
    agenix,
    home-manager
  } @inputs: let
    supportedSystems = [
      "x86_64-linux"
      "riscv64-linux"
    ];

    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

    nixpkgsFor = let
      genericFor = pkgs: system: attrs: import pkgs ({ inherit system; } // attrs);
    in forAllSystems (system:
      genericFor nixpkgs system {
        config.allowUnfree = true;

        overlays = import ./overlays/default.nix {
          pkgs-unstable = genericFor nixpkgs-unstable system { config.allowUnfree = true; };
          # TODO: Remove later
          pkgs-bcachefs = genericFor nixpkgs-bcachefs system { };
        };
      }
    );
  in rec {
    devShells = forAllSystems (system: let
      pkgs = nixpkgsFor.${system};
    in {
      default = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          busybox
          git
          gnumake
          rage
          agenix.packages.${system}.default
          home-manager.packages.${system}.default
        ];
      };
    });

    nixosConfigurations = {
      ura = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        pkgs = nixpkgsFor.${system};

        modules = [
          nixos-hardware.nixosModules.common-cpu-amd
          nixos-hardware.nixosModules.common-cpu-amd-pstate
          nixos-hardware.nixosModules.common-gpu-amd
          nixos-hardware.nixosModules.common-hidpi
          nixos-hardware.nixosModules.common-pc
          nixos-hardware.nixosModules.common-pc-ssd
          agenix.nixosModules.default
          ./hosts/ura
        ];

        specialArgs = { inherit inputs; };
      };
    };

    homeConfigurations = {
      "mado@ura" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixosConfigurations.ura.pkgs;

        modules = [
          agenix.homeManagerModules.default
          ./home/ura/mado
        ];

        extraSpecialArgs = { inherit inputs; };
      };
    };
  };
}
