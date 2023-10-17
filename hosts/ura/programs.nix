{
  programs = {
    corectrl.enable = true;
    dconf.enable = true;

    nano = {
      syntaxHighlight = true;

      nanorc = ''
        set nowrap
        set tabstospaces
        set tabsize 2
      '';
    };

    gamemode = {
      enable = true;

      settings = {
        general.renice = 10;

        gpu = {
          apply_gpu_optimisations = "accept-responsibility";
          gpu_device = 0;
          amd_performance_level = "high";
        };
      };
    };

    gamescope = {
      enable = true;
      capSysNice = true;
    };

    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}
