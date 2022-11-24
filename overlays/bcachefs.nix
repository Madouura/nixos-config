{ pkgs-unstable, ... }: {
  nixpkgs.overlays = [(final: prev: {
    linuxKernel = pkgs-unstable.linuxKernel;
    linuxPackages_testing_bcachefs = pkgs-unstable.linuxPackages_testing_bcachefs;
  })];
}
