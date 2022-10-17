{ inputs, ... }:

{
  nixpkgs.overlays = [(final: prev: {
    monero-cli = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux.monero-cli;
  })];
}
