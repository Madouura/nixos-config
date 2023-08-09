{ config, ... }: {
  boot = {
    kernelParams = [ "iommu=pt" ];
    kernel.sysctl = { "kernel.sysrq" = 1; };
    resumeDevice = "/dev/disk/by-uuid/34a6f1bc-d84f-44c8-a9aa-41eec9a15065";
    supportedFilesystems = [ "bcachefs" ];
    extraModulePackages = with config.boot.kernelPackages; [ kvmfr ];

    kernelModules = [
      "nct6775"
      "kvmfr"
    ];

    extraModprobeConfig = ''
      options kvmfr static_size_mb=128
    '';

    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };

    initrd = {
      supportedFilesystems = [ "bcachefs" ];
      luks.devices."cryptswap".device = "/dev/disk/by-uuid/d09a55c2-e5fe-4fdc-b03f-fa78e1750c23";

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
