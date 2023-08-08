{
  programs = {
    corectrl.enable = true;
    steam.enable = true;
    firefox.enable = true;
    git.enable = true;

    zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      enableBashCompletion = true;
      autosuggestions.enable = true;
    };

    nano = {
      syntaxHighlight = true;

      nanorc = ''
        set nowrap
        set tabstospaces
        set tabsize 2
      '';
    };

    starship = {
      enable = true;
      settings.command_timeout = 1000;
    };

    # gamemode = {
    #   enable = true;
# 
    #   settings = {
    #     general.renice = 10;
# 
    #     gpu = {
    #       apply_gpu_optimisations = "accept-responsibility";
    #       gpu_device = 0;
    #       amd_performance_level = "high";
    #     };
    #   };
    # };
  };
}
