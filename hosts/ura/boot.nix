{ config, ... }: {
  boot = {
    kernel.sysctl = { "kernel.sysrq" = 1; };
    kernelModules = [ "nct6775" ];
    resumeDevice = "/dev/disk/by-uuid/34a6f1bc-d84f-44c8-a9aa-41eec9a15065";
    supportedFilesystems = [ "bcachefs" ];
    tmp.cleanOnBoot = true;

    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };

    initrd = {
      supportedFilesystems = [ "bcachefs" ];
      luks.devices."cryptswap".device = "/dev/disk/by-uuid/d09a55c2-e5fe-4fdc-b03f-fa78e1750c23";
    };
  };
}
