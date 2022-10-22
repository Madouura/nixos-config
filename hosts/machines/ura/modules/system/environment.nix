{ pkgs, ... }: {
  environment = {
    shells = with pkgs; [
      bash
      ion
      zsh
    ];

    pathsToLink = [
      "/share/bash-completion"
      "/share/zsh"
    ];
  };
}
