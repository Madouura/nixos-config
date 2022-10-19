{ pkgs, ... }:

{
  imports = [
    ./modules/kdeconnect.nix
    ./modules/mpd.nix
    ./modules/mpdris2.nix
    ./modules/mpv.nix
    ./modules/ncmpcpp.nix
    ./modules/vscode.nix
  ];

  home = {
    persistence."/persist/home/mado" = {
      directories = [
        "Documents"
        "Downloads"
        "Games"
        "Music"
        "Pictures"
        "Videos"
        { directory = ".monero-gui"; } # mode = "0700"; }
        ".mozilla"
        { directory = ".shared-ringdb"; } # mode = "0700"; }
        ".steam"
        ".vscode-oss"

        ".cache/epiphany"
        ".cache/evolution"
        ".cache/geary"
        ".cache/mesa_shader_cache"
        ".cache/mozilla"
        ".cache/thumbnails"
        ".cache/tracker3"

        ".config/autostart"
        ".config/corectrl"
        ".config/discord"
        ".config/easyeffects"
        ".config/evolution"
        ".config/geary"
        ".config/GIMP"
        ".config/goverlay"
        ".config/gsconnect"
        ".config/gtk-3.0"
        { directory = ".config/Ledger Live"; } # mode = "0700"; }
        ".config/libreoffice"
        ".config/MangoHud"
        { directory = ".config/monero-project"; } # mode = "0700"; }
        ".config/qBittorrent"
        ".config/VSCodium"

        ".local/share/applications"
        ".local/share/epiphany"
        ".local/share/evolution"
        ".local/share/geary"
        ".local/share/gnome-shell"
        ".local/share/icons"
        ".local/share/mpd"
        ".local/share/nautilus"
        ".local/share/qBittorrent"
        ".local/share/Steam"
        ".local/share/Terraria"
        ".local/share/Thrive"
      ];

      files = [
        ".config/gnome-initial-setup-done"
        ".config/monitors.xml"
      ];
    };

    packages = with pkgs; [
      # Utilities #
      gamescope           # Micro-compositor for Steam
      mangohud            # Game performance overlay
      goverlay            # MangoHud config editor
      protonup            # Update proton GE
      chrome-gnome-shell  # GNOME-browser integration
      gnome.gnome-tweaks  # Extended GNOME settings

      # Office #
      libreoffice         # It's like MS Office, but free

      # Development #
      vscodium            # Text editor with IDE features

      # Internet #
      discord             # Cancer
      qbittorrent         # Torrent client
      firefox             # Web browser
      chiaki              # PS4/5 remote play

      # Media #
      easyeffects         # Audio tuning/effects for pipewire
      gimp                # Meme maker
      krita               # Art maker
      mpv                 # Video player
      youtube-dl          # Download videos from various sites
      ncmpcpp             # Terminal-based music player connected to MPD

      # Emulation #
      yuzu                # Nintendo Switch
      dolphinEmu          # Nintendo GameCube/Wii
      ares                # Retro
      pcsx2               # Sony Playstation 2
      rpcs3               # Sony Playstation 3

      # Virtualization #
      virtmanager         # Manage virtual machines

      # Crypto #
      monero-gui          # Official Monero client
      ledger-live-desktop # Official Ledger hardware wallet client
    ];
  };
}
