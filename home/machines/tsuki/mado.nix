{ inputs, pkgs, ... }: {
  imports = [
    inputs.homeage.homeManagerModules.homeage

    "${inputs.self}/home/profiles"

    "${inputs.self}/overlays/discord.nix"
    "${inputs.self}/overlays/gamescope.nix"
    "${inputs.self}/overlays/ledger-live-desktop.nix"
    "${inputs.self}/overlays/monero-cli.nix"
    "${inputs.self}/overlays/monero-gui.nix"
    "${inputs.self}/overlays/p2pool.nix"
    "${inputs.self}/overlays/protonup.nix"
    "${inputs.self}/overlays/xmrig.nix"
  ];

  home = {
    enableNixpkgsReleaseCheck = true;
    stateVersion = "22.05";
    username = "mado";
    homeDirectory = "/home/mado";
    sessionVariables = { EDITOR = "nano" };

    file = {
      "mining.sh".target = "/home/mado/.local/bin/mining.sh";
      "fs-diff.sh".target = "/home/mado/.local/bin/fs-diff.sh";
    };

    packages = with pkgs; [
      # Utilities #
      # gamescope           # Micro-compositor for Steam
      protonup            # Update proton GE
      gnome.gnome-tweaks  # Extended GNOME settings

      # Office #
      libreoffice         # It's like MS Office, but free

      # Internet #
      discord             # Cancer
      qbittorrent         # Torrent client

      # Media #
      gimp                # Meme maker

      # Crypto #
      ledger-live-desktop # Official Ledger hardware wallet client
      monero-cli          # Official Monero client (CLI)
      monero-gui          # Official Monero client (GUI)
      p2pool              # Decentralized monero mining pool
      xmrig               # The actual miner
    ];
  };

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  ##            Homeage stuff here           ##
  ## https://github.com/jordanisaacs/homeage ##

  programs = {
    bash.historyFile = "/home/mado/.bash_history";
    mpv.config.screenshot-directory = "/home/mado/Pictures/Screenshots/mpv";

    git = {
      userName = "Madoura";
      userEmail = "madouura@gmail.com";
      signing.key = "50CCE80199B1F736";
    };
  };

  services.mpd = {
    musicDirectory = "/home/mado/Music";

    extraConfig = ''
      audio_output {
        type  "pipewire"
        name  "PipeWire Sound Server"
      }
    '';
  };
}
