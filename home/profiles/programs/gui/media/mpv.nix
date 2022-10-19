{
  programs.mpv = {
    enable = true;
    defaultProfiles = [ "gpu-hq" ];

    config = {
      scale = "ewa_lanczossharp";
      cscale = "ewa_lanczossharp";
      video-sync = "display-resample";
      interpolation = true;
      tscale = "oversample";
      no-border = true;
      sub-auto = "fuzzy";
      alang = "jp,jpn,japan";
      slang = "en,eng,english";
      screenshot-template = "%F (%p)";
    };
  };
}
