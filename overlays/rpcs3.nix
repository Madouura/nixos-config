{ pkgs-unstable, ... }: {
  nixpkgs.overlays = [(final: prev: {
    rpcs3 = pkgs-unstable.rpcs3;
  })];
}
