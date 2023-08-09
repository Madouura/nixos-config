{ pkgs, ... }: {
  services = {
    timesyncd.enable = true;
    printing.enable = true;
    gnome.gnome-browser-connector.enable = true;

    udev = {
      packages = with pkgs; [ gnome.gnome-settings-daemon ];

      extraRules = ''
        SUBSYSTEM=="kvmfr", OWNER="mado", GROUP="kvm", MODE="0660"
      '';
    };

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

      deviceSection = ''
        Option "TearFree"        "true"
        Option "VariableRefresh" "true"
      '';
    };

    mpd = {
      enable = true;
      startWhenNeeded = true;
      user = "mado";
      group = "users";
      musicDirectory = "/home/mado/Music";

      extraConfig = ''
        audio_output {
          type  "pulse"
          name  "Pulseaudio Sound Server"
        }
      '';
    };
  };
}
