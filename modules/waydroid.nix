{ inputs, ... }:

{
  imports = [ "${inputs.nixpkgs-unstable}/nixos/modules/virtualisation/waydroid.nix" ];
  disabledModules = [ "virtualisation/waydroid.nix" ];
}
