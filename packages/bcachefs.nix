{ inputs, ... }:

{
  nixpkgs.overlays = [(final: prev: {
    linuxKernel = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux.linuxKernel;
    linuxPackages_bcachefs_testing = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux.linuxPackages_bcachefs_testing;
  })];
}
