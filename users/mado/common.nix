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
        ".monero-gui"
        ".mozilla"
        ".pki/nssdb"
        ".shared-ringdb"
        ".steam"
        ".vscode-oss"

        ".cache/corectrl"
        ".cache/epiphany"
        ".cache/evolution"
        ".cache/fontconfig"
        ".cache/geary"
        ".cache/gnome-control-center-goa-helper"
        ".cache/gnome-desktop-thumbnailer"
        ".cache/gstreamer-1.0"
        ".cache/mesa_shader_cache"
        ".cache/mozilla"
        ".cache/qtshadercache-x86_64-little_endian-lp64"
        ".cache/radv_builtin_shaders32"
        ".cache/radv_builtin_shaders64"
        ".cache/thumbnails"
        ".cache/tracker3"

        ".config/autostart"
        ".config/cef_user_data/Dictionaries"
        ".config/corectrl"
        ".config/chromium/NativeMessagingHosts"
        ".config/discord"
        ".config/easyeffects"
        ".config/evolution"
        ".config/geary"
        ".config/GIMP"
        ".config/gnome-control-center/backgrounds"
        ".config/goa-1.0"
        ".config/goverlay"
        ".config/gsconnect"
        ".config/gtk-3.0"
        ".config/gtk-4.0"
        ".config/kdeconnect"
        ".config/Ledger Live"
        ".config/libreoffice"
        ".config/MangoHud"
        ".config/monero-project"
        ".config/pulse"
        ".config/qBittorrent"
        ".config/VSCodium"

        ".local/share/applications"
        ".local/share/backgrounds"
        ".local/share/dbus-1/services"
        ".local/share/epiphany"
        ".local/share/evolution"
        ".local/share/geary"
        ".local/share/gnome-photos/tracker3"
        ".local/share/gnome-shell"
        ".local/share/gvfs-metadata"
        ".local/share/icc"
        ".local/share/icons"
        ".local/share/mpd"
        ".local/share/nautilus"
        ".local/share/qBittorrent"
        ".local/share/sounds"
        ".local/share/Steam"
        ".local/share/Terraria"
        ".local/share/Thrive"
        ".local/share/vulkan"
        ".local/share/webkitgtk"
        ".local/state/wireplumber"
      ];

      files = [
        ".config/gnome-initial-setup-done"
        ".config/mimeapps.list"
        ".config/monitors.xml"
        ".config/user-dirs.dirs"
        ".config/user-dirs.locale"

        ".local/share/recently-used.xbel"
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
