{ pkgs, ... }: {
  qt = {
    enable = true;
    platformTheme = "gnome";

    style = {
      name = "Tokyonight-Dark-B";
      package = pkgs.tokyo-night-gtk-variants.themes.dark-b;
    };
  };
}
