{
  boot = {
    kernel.sysctl = { "kernel.sysrq" = 1; };
    # resumeDevice = "/dev/disk/by-uuid/a8e45243-e6ae-47a3-b3a8-965c2eb0ed98";
    # supportedFilesystems = [ "vfat" "bcachefs" ];

    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };

    initrd = {
      # supportedFilesystems = [ "vfat" "bcachefs" ];
      # availableKernelModules = [ "amdgpu" "nvidia" ];
      # luks.devices."cryptswap".device = "/dev/disk/by-uuid/1acd8b73-20f1-4697-915a-b931e5b0b0a1";
    };
  };

  fileSystems = {
    "/".options = [ "discard" ];
    "/boot".options = [ "discard" ];
  };
}
