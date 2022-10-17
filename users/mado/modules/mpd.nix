{
  services.mpd = {
    enable = true;
    musicDirectory = "$HOME/Music";

    extraConfig = ''
      audio_output {
        type  "pipewire"
        name  "PipeWire Sound Server"
      }
    '';
  };
}
