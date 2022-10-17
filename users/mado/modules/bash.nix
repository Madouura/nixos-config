{
  programs.bash = {
    enable = true;
    historyControl = [ "erasedups" ];

    shellAliases = {
      ssh = "env TERM=xterm-256-color ssh";
    };

    bashrcExtra = ''
      export EDITOR=nano
    '';
  };
}
