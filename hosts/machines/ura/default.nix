{ inputs, pkgs, ... }: {
  imports = [
    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.nixos-hardware.nixosModules.common-cpu-amd-pstate
    inputs.nixos-hardware.nixosModules.common-gpu-amd
    inputs.nixos-hardware.nixosModules.common-pc
    inputs.nixos-hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix

    ./modules

    "${inputs.self}/hosts/profiles/system"
    "${inputs.self}/hosts/profiles/users/mado.nix"

    "${inputs.self}/overlays/linux.nix"
    "${inputs.self}/overlays/monero.nix"
    "${inputs.self}/overlays/virtiofsd.nix"
    "${inputs.self}/overlays/waydroid.nix"
    "${inputs.self}/overlays/ledger-live-desktop.nix"
  ];

  system.stateVersion = "22.11";
}
