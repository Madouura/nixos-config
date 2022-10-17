{
  services.mpd = {
    enable = true;
    musicDirectory = "/home/mado/Music";

    extraConfig = ''
      audio_output {
        type  "pipewire"
        name  "PipeWire Sound Server"
      }
    '';
  };
}
