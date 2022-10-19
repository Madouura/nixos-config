{ inputs, ... }: {
  nixpkgs.overlays = [(final: prev: {
    discord = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux.discord;
  })];
}
