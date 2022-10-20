{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    extensions = [
      pkgs.vscode-extensions.arrterian.nix-env-selector
      # pkgs.vscode-extensions.jamesottaway.nix-develop
      pkgs.vscode-extensions.jnoortheen.nix-ide
      # pkgs.vscode-extensions.mkhl.direnv
    ];
  };
}
