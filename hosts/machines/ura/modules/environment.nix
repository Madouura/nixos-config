{ inputs, pkgs, ... }: {
  environment = {
    shells = with pkgs; [
      bash
      zsh
    ];

    pathsToLink = [
      "/share/bash-completion"
      "/share/zsh"
    ];

    variables = {
      EDITOR = "nano";
      VISUAL = "codium";
      QT_QPA_PLATFORM = "wayland"; # Fix QT applications TODO: Remove when fixed upstream
    };

    etc = {
      "nix/path/nixpkgs".source = inputs.nixpkgs;
      "nix/path/active-config".source = inputs.self;
    };

    systemPackages = with pkgs; [
      lm_sensors
      pciutils
      usbutils
      gptfdisk
      htop
      nload
      dnsmasq
      virtiofsd
      gamescope
      protonup
      gnome.gnome-tweaks
      discord
      element-desktop
      qbittorrent
      gimp
      lutris
      wineWowPackages.stable
      winetricks
      virtmanager
      pulseeffects-legacy
      vscodium
      mangohud
      mpv
      gnupg
      yt-dlp
      ncmpcpp
      direnv
      looking-glass-client
      scream
      pinentry-curses
      pcsx2
      gnomeExtensions.appindicator
      gnomeExtensions.freon
      inputs.fs2-nixpkgs.legacyPackages.x86_64-linux.fs2-knossos # TODO: Remove extra when PR is merged
    ];
  };
}
