{ pkgs, ... }: {
  programs.firefox = {
    enable = true;

    package = pkgs.firefox-wayland.override {
      cfg.enableGnomeExtensions = true;
    };
  };
}
