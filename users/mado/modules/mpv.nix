{
  programs.mpv = {
    enable = true;
    defaultProfiles = [ "gpu-hq" ];

    config = {
      scale = "ewa_lanczossharp";
      cscale = "ewa_lanczossharp";
      video-sync = "display-resample";
      interpolation = "";
      tscale = "oversample";
      no-border = "";
      sub-auto = "fuzzy";
      alang = "jp,jpn,japan";
      slang = "en,eng,english";
      screenshot-template = "%F (%p)";
      screenshot-directory = "$HOME/Pictures/Screenshots/mpv";
    };
  };
}
