{ inputs, ... }:

{
  imports = [
    "${inputs.self}/modules/monero.nix"
    "${inputs.self}/modules/waydroid.nix"
  ];
}
