{ pkgs-unstable, ... }: {
  nixpkgs.overlays = [(final: prev: {
    monero-cli = pkgs-unstable.monero-cli;
  })];
}
