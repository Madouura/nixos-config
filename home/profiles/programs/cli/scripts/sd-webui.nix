{ config, pkgs, ... }: {
  home.file."sd-webui.sh" = {
    executable = true;

    text = ''
      #!${ pkgs.runtimeShell }
      cd ${ config.home.homeDirectory }/Documents/Development/stable-diffusion-webui
      nix develop
    '';
  };
}
