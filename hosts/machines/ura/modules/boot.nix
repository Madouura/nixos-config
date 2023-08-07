{ config, pkgs, ... }: {
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    kernelParams = [ "iommu=pt" ];
    kernel.sysctl = { "kernel.sysrq" = 1; };
    resumeDevice = "/dev/disk/by-uuid/0f86d8c2-23a9-4db6-8ed3-0ea502ec54cb";
    # extraModulePackages = with config.boot.kernelPackages; [ kvmfr ];

    kernelModules = [
      "nct6775"
      # "kvmfr"
    ];

    # extraModprobeConfig = ''
    #   options kvmfr static_size_mb=128
    # '';

    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };

    initrd = {
      luks.devices."cryptswap".device = "/dev/disk/by-uuid/efea25af-f77b-47c0-89e5-be66216d28a9";
      luks.devices."cryptwrot".device = "/dev/disk/by-uuid/4d55642b-d3c8-4704-bcc4-65b2aa62b75f";

      availableKernelModules = [
        "vfio_pci"
        "amdgpu"
      ];

      preDeviceCommands = ''
        DEVS="0000:10:00.0 0000:10:00.1"

        # Fix REBAR issue with windows VM by setting this to 8 MB.
        echo -n 3 > /sys/bus/pci/devices/0000:10:00.0/resource2_resize

        for DEV in $DEVS; do
          echo "vfio-pci" > /sys/bus/pci/devices/$DEV/driver_override
        done

        modprobe -i vfio-pci
        modprobe -i amdgpu
      '';
    };
  };
}
