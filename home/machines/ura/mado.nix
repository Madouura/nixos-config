{ inputs, config, pkgs, ... }: {
  imports = [
    inputs.homeage.homeManagerModules.homeage

    "${inputs.self}/home/profiles"

    # "${inputs.self}/overlays/discord.nix"
    # "${inputs.self}/overlays/gamescope.nix"
    # "${inputs.self}/overlays/ledger-live-desktop.nix"
    # "${inputs.self}/overlays/monero-cli.nix"
    # "${inputs.self}/overlays/monero-gui.nix"
    # "${inputs.self}/overlays/p2pool.nix"
    # "${inputs.self}/overlays/protonup.nix"
    # "${inputs.self}/overlays/rpcs3.nix"
    # "${inputs.self}/overlays/xmrig.nix"
  ];

  systemd.user.startServices = "sd-switch";

  home = {
    enableNixpkgsReleaseCheck = true;
    stateVersion = "22.11";
    username = "mado";
    homeDirectory = "/home/mado";
    sessionPath = [ "/home/mado/.local/bin" ];
    sessionVariables = { EDITOR = "nano"; };
    shellAliases = { ls = "ls --color"; };

    file = {
      "mining.sh".target = "/home/mado/.local/bin/mining.sh";
      "fs-diff.sh".target = "/home/mado/.local/bin/fs-diff.sh";
      "sd-webui.sh".target = "/home/mado/.local/bin/sd-webui.sh";
    };

    # TODO: Figure out overlay issue (Does this apply in 22.11?)
    packages = with pkgs; [
      # Utilities #
      gamescope               # Micro-compositor for Steam
      protonup                # Update proton GE
      gnome.gnome-tweaks      # Extended GNOME settings

      # Office #
      libreoffice             # It's like MS Office, but free

      # Internet #
      discord                 # Cancer
      element-desktop         # Maybe less cancer?
      qbittorrent             # Torrent client
      chiaki                  # PS4/5 remote play

      # Media #
      gimp                    # Meme maker
      krita                   # Art maker

      # Emulation #
      yuzu                    # Nintendo Switch
      dolphinEmu              # Nintendo GameCube/Wii
      ares                    # Retro
      pcsx2                   # Sony Playstation 2
      rpcs3                   # Sony Playstation 3

      # Virtualization #
      virtmanager             # Manage virtual machines

      # Crypto #
      ledger-live-desktop     # Official Ledger hardware wallet client
      monero-cli              # Official Monero client (CLI)
      monero-gui              # Official Monero client (GUI)
      p2pool                  # Decentralized monero mining pool
      xmrig                   # The actual miner
    ];
  };

  homeage = {
    identityPaths = [ "/home/mado/.ssh/home_ed25519" ];
    file."monero_pubaddr".source = "${inputs.self}/secrets/monero_pubaddr.age";
    file."ssh-config-addon".source = "${inputs.self}/secrets/ssh-config-addon.age";
  };

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  programs = {
    bash.historyFile = "/home/mado/.bash_history";
    zsh.history.path = "/home/mado/.zsh_history";
    mpv.config.screenshot-directory = "/home/mado/Pictures/Screenshots/mpv";

    ssh.extraConfig = ''
      Include ${ builtins.replaceStrings [ "$UID" ] [ "1000" ] config.homeage.file."ssh-config-addon".path }
    '';

    git = {
      userName = "Madoura";
      userEmail = "madouura@gmail.com";
      signing.key = "3201136B3DB072F9";
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
