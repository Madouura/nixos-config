{ inputs, ... }: {
  nixpkgs.overlays = [(final: prev: {
    virtiofsd = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux.virtiofsd;
  })];
}
