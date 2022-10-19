{ inputs, ... }: {
  nixpkgs.overlays = [(final: prev: {
    p2pool = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux.p2pool;
  })];
}
