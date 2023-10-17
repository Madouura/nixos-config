{ config, ... }: {
  services = {
    mpd-discord-rpc.enable = true;

    mpd = {
      enable = true;
      musicDirectory = "${config.home.homeDirectory}/Music";

      extraConfig = ''
        audio_output {
          type "pipewire"
          name "PipeWire Sound Server"
        }
      '';
    };

    mpdris2 = {
      enable = true;
      multimediaKeys = true;
    };

    easyeffects = {
      enable = true;
      preset = "Meze Liric";
    };
  };
}
