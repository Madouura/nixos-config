{ pkgs-unstable, ... }: {
  nixpkgs.overlays = [(final: prev: {
    linuxKernel = pkgs-unstable.linuxKernel;
    linuxPackages = pkgs-unstable.linuxPackages;
    linuxPackages_zen = pkgs-unstable.linuxPackages_zen;
  })];
}
