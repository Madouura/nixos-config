{ inputs, ... }: {
  imports = [
    ./monero-cli.nix
    "${inputs.nixpkgs-unstable}/nixos/modules/services/networking/monero.nix"
  ];

  disabledModules = [ "services/networking/monero.nix" ];
}
