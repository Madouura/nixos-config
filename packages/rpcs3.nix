{ inputs, ... }:

{
  nixpkgs.overlays = [(final: prev: {
    rpcs3 = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux.rpcs3;
  })];
}
