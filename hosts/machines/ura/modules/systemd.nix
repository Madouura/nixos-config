{ pkgs,  ... }: let
  qemuHook = pkgs.writeShellScript "qemu-hook.sh" ''
    GUEST_NAME="$1"
    OPERATION="$2"
    SUB_OPERATION="$3"
    ALLOWED_CPUS=0-7,16-23
    TOTAL_CPUS=0-31
    ON_GOVERNOR=performance
    OFF_GOVERNOR=ondemand

    if [ "$GUEST_NAME" == "win11" ]; then
      if [ "$OPERATION" == "prepare" ] && [ "$SUB_OPERATION" == "begin" ]; then
        for governor in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do
          echo $ON_GOVERNOR > $governor;
        done

        systemctl set-property --runtime -- user.slice AllowedCPUs=$ALLOWED_CPUS
        systemctl set-property --runtime -- system.slice AllowedCPUs=$ALLOWED_CPUS
        systemctl set-property --runtime -- init.scope AllowedCPUs=$ALLOWED_CPUS

        echo 9216 > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages
        sync
        echo 3 > /proc/sys/vm/drop_caches
        sync
        echo 1 > /proc/sys/vm/compact_memory
      fi

      if [ "$OPERATION" == "release" ] && [ "$SUB_OPERATION" == "end" ]; then
        systemctl set-property --runtime -- user.slice AllowedCPUs=$TOTAL_CPUS
        systemctl set-property --runtime -- system.slice AllowedCPUs=$TOTAL_CPUS
        systemctl set-property --runtime -- init.scope AllowedCPUs=$TOTAL_CPUS

        for governor in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do
          echo $OFF_GOVERNOR > $governor;
        done

        echo 0 > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages
        sync
        echo 3 > /proc/sys/vm/drop_caches
        sync
        echo 1 > /proc/sys/vm/compact_memory
      fi
    fi
  '';
in {
  systemd.tmpfiles.rules = [
    "L+ /var/lib/libvirt/hooks/qemu - - - - ${qemuHook}"
    "f /dev/shm/looking-glass 0660 mado kvm -"
  ];
}
