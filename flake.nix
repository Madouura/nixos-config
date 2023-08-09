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

    # TODO: Remove when https://github.com/NixOS/nixpkgs/pull/236650 is merged
    fs2-nixpkgs.url = "github:Madouura/nixpkgs/pr/fs2-old-knossos";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    nixos-hardware,
    agenix,
    fs2-nixpkgs
  } @inputs: let
    supportedSystems = [ "x86_64-linux" ];
    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

    nixpkgsFor = forAllSystems (system: import nixpkgs {
      inherit system;
      config.allowUnfree = true;

      # TODO: Find better way to do this
      overlays = let
        pkgs-unstable = unstableFor.${system};
      in [(final: prev: {
        # linuxKernel = pkgs-unstable.linuxKernel;
        # linuxPackages = pkgs-unstable.linuxPackages;
        linuxPackages_testing_bcachefs = pkgs-unstable.linuxPackages_testing_bcachefs;
        linux_testing_bcachefs = pkgs-unstable.linux_testing_bcachefs;
        bcachefs-tools = pkgs-unstable.bcachefs-tools;
      })];
   });

    unstableFor = forAllSystems (system: import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    });
  in {
    devShells = forAllSystems ( system: let
      pkgs = nixpkgsFor.${system};
    in {
      default = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          age
          git
          gnumake
          gnupg
        ];
      };
    });

    nixosConfigurations = {
      # Desktop
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
          ./hosts/machines/ura
        ];

        specialArgs = {
          inherit inputs;
          pkgs-unstable = unstableFor.${system};
        };
      };
    };
  };
}
