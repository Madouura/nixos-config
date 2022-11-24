{ pkgs-unstable, ... }: {
  nixpkgs.overlays = [(final: prev: {
    gamescope = pkgs-unstable.gamescope;
  })];
}
