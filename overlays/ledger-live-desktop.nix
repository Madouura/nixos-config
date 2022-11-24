{ pkgs-unstable, ... }: {
  nixpkgs.overlays = [(final: prev: {
    ledger-live-desktop = pkgs-unstable.ledger-live-desktop;
  })];
}
