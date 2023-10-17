{ pkgs, ... }: {
  gtk = {
    enable = true;

    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };

    iconTheme = {
      name = "Tokyonight-Dark";
      package = pkgs.tokyo-night-gtk-variants.icons.dark;
    };

    theme = {
      name = "Tokyonight-Dark-BL";
      package = pkgs.tokyo-night-gtk-variants.themes.dark-bl;
    };
  };
}
