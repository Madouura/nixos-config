{
  programs.bash = {
    enable = true;
    historyControl = [ "erasedups" ];
    historyFile = "/home/mado/.bash_history";

    shellAliases = {
      ssh = "env TERM=xterm-256-color ssh";
    };

    bashrcExtra = ''
      export EDITOR=nano
    '';
  };
}
