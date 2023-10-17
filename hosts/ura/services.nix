{ pkgs, ... }: {
  services = {
    timesyncd.enable = true;
    printing.enable = true;
    fwupd.enable = true;
    gnome.gnome-browser-connector.enable = true;

    tor = {
      enable = true;
      client.enable = true;
      torsocks.enable = true;
    };

    openssh = {
      enable = true;
      ports = [ 19972 ]; # Purposefully on a non-open port

      settings = {
        PasswordAuthentication = false;
        PermitRootLogin = "no";
      };
    };

    xserver = {
      enable = true;
      digimend.enable = true;
      desktopManager.gnome.enable = true;
      videoDrivers = [ "amdgpu" ];

      displayManager.gdm = {
        enable = true;
        autoSuspend = false;
      };
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}
