{
  boot = {
    supportedFilesystems = [ "btrfs" ];
    resumeDevice = "/dev/disk/by-uuid/007a3d3f-39af-4a0b-b4bb-a08e2bd31a7e";

    initrd = {
      supportedFilesystems = [ "btrfs" ];
      luks.devices."cryptswap".device = "/dev/disk/by-uuid/00aabdaf-fd9e-440d-a3d2-dc6d52329518";
      luks.devices."cryptrot2".device = "/dev/disk/by-uuid/0a15ea35-adc1-4d84-9ef4-b07a15048ebe";
    };
  };

  fileSystems = {
    "/boot".options = [ "discard" ];
    "/mnt/stor".options = [ "compress=zstd" ];
    "/etc/ssh".neededForBoot = true;

    "/".options = [
      "discard=async"
      "compress=zstd"
    ];

    "/nix".options = [
      "discard=async"
      "compress=zstd"
    ];

    "/persist" = {
      neededForBoot = true;

      options = [
        "discard=async"
        "compress=zstd"
      ];
    };

    "/var/log" = {
      neededForBoot = true;

      options = [
        "discard=async"
        "compress=zstd"
      ];
    };
  };
}
