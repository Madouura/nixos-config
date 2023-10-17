{ config, pkgs, ... }: {
  programs = {
    home-manager.enable = true;
    ncmpcpp.enable = true;
    gh.enable = true;

    nushell = {
      enable = true;

      environmentVariables = {
        EDITOR = "nano";
        VISUAL = "codium";
      };

      shellAliases = {
        nixdev = "nix develop -c $env.SHELL";
      };

      extraConfig = ''
        $env.config = {
          show_banner: false
        }
      '';
    };

    ssh = {
      enable = true;
      compression = true;
    };

    direnv = {
      enable = true;
      enableBashIntegration = true;
      enableNushellIntegration = true;
      nix-direnv.enable = true;
    };

    starship = {
      enable = true;
      enableBashIntegration = true;
      enableNushellIntegration = true;
      settings.command_timeout = 4000;
    };

    git = {
      enable = true;
      userName = "Madoura";
      signing.key = "BFA571B4ED28B32FAB2FA2CA1B9BB76A2B71922D";
      includes = [ { path = config.age.secrets."mado_ura_git_email".path; } ];
      signing.signByDefault = true;
    };

    mpv = {
      enable = true;
      defaultProfiles = [ "gpu-hq" ];

      config = {
        profile = "gpu-hq";
        scale = "ewa_lanczossharp";
        cscale = "ewa_lanczossharp";
        video-sync = "display-resample";
        interpolation = true;
        tscale = "oversample";
        keep-open = true;
        no-border = true;
        ytdl-format = "bestvideo+bestaudio";
        sub-auto = "fuzzy";
        slang = "english,eng,en";
        alang = "japanese,japan,jpn,jp";
        screenshot-template = "%F (%p)";
        screenshot-directory = "${config.home.homeDirectory}/Pictures/Screenshots/mpv";
      };
    };

    vscode = {
      enable = true;
      package = pkgs.vscodium;

      extensions = [
        pkgs.vscode-extensions.arrterian.nix-env-selector
        pkgs.vscode-extensions.jnoortheen.nix-ide
        pkgs.vscode-extensions.mkhl.direnv
      ];
    };

    yt-dlp = {
      enable = true;

      settings = {
        embed-thumbnail = true;
        embed-subs = true;
      };
    };

    firefox = {
      enable = true;
      package = pkgs.firefox.override { nativeMessagingHosts = with pkgs; [ gnome-browser-connector ]; };
    };
  };
}
