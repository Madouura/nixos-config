{ pkgs-unstable, ... }: {
  nixpkgs.overlays = [(final: prev: {
    monero-gui = pkgs-unstable.monero-gui;
  })];
}
