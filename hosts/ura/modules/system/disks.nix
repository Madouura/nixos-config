{
  boot = {
    resumeDevice = "/dev/disk/by-uuid/a8e45243-e6ae-47a3-b3a8-965c2eb0ed98";
    # supportedFilesystems = [ "vfat" "bcachefs" ];

    initrd = {
      # supportedFilesystems = [ "vfat" "bcachefs" ];
      luks.devices."cryptswap".device = "/dev/disk/by-uuid/1acd8b73-20f1-4697-915a-b931e5b0b0a1";
    };
  };

  fileSystems = {
    "/".options = [ "discard" ];
    "/boot".options = [ "discard" ];

    "/home/mado/.virtiofs/Music" = {
      device = "/home/mado/Music";
      fsType = "none";
      options = [ "ro" "bind" ];
    };

    "/home/mado/.virtiofs/Games" = {
      device = "/home/mado/Games";
      fsType = "none";
      options = [ "rw" "bind" ];
    };
  };
}
