{ inputs, ... }: {
  imports = [ "${inputs.nixpkgs-unstable}/nixos/modules/virtualisation/waydroid.nix" ];
  disabledModules = [ "virtualisation/waydroid.nix" ];

  nixpkgs.overlays = [(final: prev: {
    waydroid = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux.waydroid;
  })];
}
