{ pkgs-unstable, ... }: {
  nixpkgs.overlays = [(final: prev: {
    virtiofsd = pkgs-unstable.virtiofsd;
  })];
}
