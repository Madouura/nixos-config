{
  environment.variables = {
    EDITOR = "nano";
    VISUAL = "nano";
  };

  programs.nano = {
    syntaxHighlight = true;

    nanorc = ''
      set nowrap
      set tabstospaces
      set tabsize 2
    '';
  };
}
