{ pkgs, ... }: {
  environment.shells = with pkgs; [
    ion
    zsh
  ];
}