{ lib, pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    kernelModules = [ "nct6775" "jc42" ];
    kernel.sysctl = { "kernel.sysrq" = 1; };

    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };

    initrd = {
      availableKernelModules = [ "amdgpu" ];

      postDeviceCommands = lib.mkBefore ''
        btrfs device scan

        mkdir -p /mnt
        mount -o discard=async,compress=zstd /dev/mapper/cryptrot1 /mnt

        btrfs subvolume list -o /mnt/root |
        cut -f9 -d' ' |
        while read subvolume; do
          echo "deleting /$subvolume subvolume..."
          btrfs subvolume delete "/mnt/$subvolume"
        done &&
        echo "deleting /root subvolume..." &&
        btrfs subvolume delete /mnt/root

        echo "restoring blank /root subvolume..."
        btrfs subvolume snapshot /mnt/root-blank /mnt/root
        umount /mnt
      '';
    };
  };
}
