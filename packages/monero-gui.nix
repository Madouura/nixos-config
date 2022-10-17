{ inputs, ... }:

{
  nixpkgs.overlays = [(final: prev: {
    monero-gui = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux.monero-gui;
  })];
}
