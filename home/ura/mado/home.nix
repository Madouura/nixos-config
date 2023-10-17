{ pkgs, ... }: {
  home = {
    stateVersion = "23.11";
    enableNixpkgsReleaseCheck = true;
    username = "mado";
    homeDirectory = "/home/mado";

    sessionVariables = {
      VISUAL = "codium";
    };

    pointerCursor = {
      gtk.enable = true;
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };

    packages = with pkgs; [
      protonup-qt
      element-desktop
      discord
      webcord
      qbittorrent
      gimp
      (lutris.override { extraPkgs = pkgs: [ wineWowPackages.stable ]; })
      gnome.gnome-tweaks
      gnomeExtensions.appindicator
      gnomeExtensions.freon
    ];
  };
}
