{
  services.gnome.gnome-browser-connector.enable = true;

  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;

    displayManager.gdm = {
      enable = true;
      autoSuspend = false;
    };
  };
}
