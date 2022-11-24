{ inputs, pkgs-unstable, ... }: {
  imports = [ "${inputs.nixpkgs-unstable}/nixos/modules/virtualisation/waydroid.nix" ];
  disabledModules = [ "virtualisation/waydroid.nix" ];

  nixpkgs.overlays = [(final: prev: {
    waydroid = pkgs-unstable.waydroid;
  })];
}
