{ inputs, ... }: {
  imports = [
    inputs.nixos-hardware.nixosModules.asus-zephyrus-ga503
    inputs.nixos-hardware.nixosModules.asus-battery
    inputs.nixos-hardware.nixosModules.common-cpu-amd-pstate
    inputs.nixos-hardware.nixosModules.common-gpu-amd
    inputs.nixos-hardware.nixosModules.common-pc

    ./hardware-configuration.nix
  ];

  system.stateVersion = "22.11";
}
