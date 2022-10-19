{ inputs, ... }: {
  nixpkgs.overlays = [(final: prev: {
    xmrig = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux.xmrig;
  })];
}
