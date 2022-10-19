{ lib, pkgs, desktop, inputs, ... }:

{
  # https://github.com/MatthewCroughan/nixcfg/blob/f6188561e9ebc6023d9129dca2912d1398db3cb6/users/matthew/default.nix#L4-L10
  imports = [
    "${inputs.impermanence}/home-manager.nix"
    ./modules/bash.nix
    ./modules/fs-diff.nix
    ./modules/git.nix
    ./modules/gpg.nix
    ./modules/mining.nix
    ./modules/nix-direnv.nix
  ] ++ lib.optional (desktop) ./desktop.nix
    ++ lib.optional (!desktop) ./other.nix;

  home = {
    stateVersion = "22.05";
    enableNixpkgsReleaseCheck = true;
    username = "mado";
    homeDirectory = "/home/mado";

    persistence."/persist/home/mado" = {
      files = [ ".bash_history" ];

      directories = [
        ".gnupg"
        ".p2pool"
        ".ssh"
        ".local/share/direnv"
        ".local/share/keyrings"
      ];
    };

    packages = with pkgs; [
      monero-cli
      p2pool
      xmrig
    ];
  };
}
