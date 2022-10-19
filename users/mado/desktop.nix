{ pkgs, ... }:

{
  imports = [ ./common.nix ];

  home = {
    persistence."/persist/home/mado" = {
      allowOther = true;

      directories = [
        ".cache/rpcs3"
        ".cache/yuzu"

        ".config/PCSX2"
        ".config/rpcs3"
        ".config/yuzu"

        ".local/etc/virtiofs"
        ".local/share/krita"
        ".local/share/yuzu"
      ];

      files = [
        ".bash_history"
        ".nix-channels"
        ".config/kritadisplayrc"
        ".config/kritarc"
      ];
    };

    packages = with pkgs; [
      yuzu
      dolphinEmu
      ares
      chiaki
    ];
  };
}
