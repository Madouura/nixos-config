{
  environment.variables = {
    EDITOR = "nano";
    # VISUAL = "codium"; # FIXME: Problems with rebasing
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
