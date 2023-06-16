{ pkgs, ... }: {
  fonts = {
    fontDir.enable = true;
    fontconfig.enable = true;

    fonts = with pkgs; [
      nerdfonts
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      source-code-pro
      source-han-mono
      source-han-sans
      source-han-serif
      ipafont
      baekmuk-ttf
      wqy_zenhei
    ];
  };
}
