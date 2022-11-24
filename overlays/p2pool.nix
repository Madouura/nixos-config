{ pkgs-unstable, ... }: {
  nixpkgs.overlays = [(final: prev: {
    p2pool = pkgs-unstable.p2pool;
  })];
}
