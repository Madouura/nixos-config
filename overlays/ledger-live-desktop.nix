{ inputs, ... }: {
  nixpkgs.overlays = [(final: prev: {
    ledger-live-desktop = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux.ledger-live-desktop;
  })];
}
