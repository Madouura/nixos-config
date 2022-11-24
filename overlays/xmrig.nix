{ pkgs-unstable, ... }: {
  nixpkgs.overlays = [(final: prev: {
    xmrig = pkgs-unstable.xmrig;
  })];
}
