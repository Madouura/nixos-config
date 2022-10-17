{ inputs, ... }:

{
  nixpkgs.overlays = [(final: prev: {
    waydroid = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux.waydroid;
  })];
}
