{ pkgs, ... }: {
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    supportedFilesystems = [ "btrfs" ];
    resumeDevice = "/dev/disk/by-uuid/909f3c62-12f5-4220-b224-facd2a6ce364";

    initrd = {
      supportedFilesystems = [ "btrfs" ];
      luks.devices."cryptswap".device = "/dev/disk/by-uuid/30175aa9-b4f5-4ee8-b902-df9e60645e85";
      luks.devices."cryptrot2".device = "/dev/disk/by-uuid/8616e0e0-eb27-4a97-af99-5fa184020238";
    };
  };

  fileSystems = {
    "/boot".options = [ "discard" ];

    "/".options = [
      "discard=async"
      "compress=zstd"
    ];

    "/nix".options = [
      "discard=async"
      "compress=zstd"
    ];

    "/home".options = [
      "discard=async"
      "compress=zstd"
    ];
  };
}
