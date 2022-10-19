{ inputs, ... }: {
  nixpkgs.overlays = [(final: prev: {
    gamescope = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux.gamescope;
  })];
}
