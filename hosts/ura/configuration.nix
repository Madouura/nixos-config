{
  system.stateVersion = "22.05";

  imports = [
    ./hardware-configuration.nix

    ./modules/other/corectrl.nix
    ./modules/other/fuse.nix
    ./modules/other/gamemode.nix
    ./modules/other/gdm.nix
    ./modules/other/gnome.nix
    ./modules/other/libvirtd.nix
    ./modules/other/pipewire.nix
    ./modules/other/waydroid.nix

    ./modules/system/boot.nix
    ./modules/system/disks.nix
    ./modules/system/hardware.nix
    ./modules/system/modules.nix
    ./modules/system/networking.nix
    ./modules/system/nix.nix
    ./modules/system/packages.nix
    ./modules/system/persistent.nix
    ./modules/system/profiles.nix
    ./modules/system/security.nix
    ./modules/system/time.nix
    ./modules/system/users.nix
  ];
}
