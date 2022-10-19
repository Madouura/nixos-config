{ inputs, ... }: {
  nixpkgs.overlays = [(final: prev: {
    linuxKernel = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux.linuxKernel;
    linuxPackages_testing_bcachefs = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux.linuxPackages_testing_bcachefs;
  })];
}
