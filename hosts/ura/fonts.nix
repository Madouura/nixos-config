{ pkgs, ... }: {
  fonts = {
    packages = with pkgs; [
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
      lexend
      material-symbols
    ];
  };
}
