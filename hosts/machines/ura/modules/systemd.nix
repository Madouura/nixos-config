{ pkgs,  ... }: let
  qemuHook = pkgs.writeShellScript "qemu-hook.sh" ''
    if [ "$1" == "win11" ]; then
      if [ "$2" == "started" ]; then
        systemctl set-property --runtime -- system.slice AllowedCPUs=0-7,16-23
        systemctl set-property --runtime -- user.slice AllowedCPUs=0-7,16-23
        systemctl set-property --runtime -- init.scope AllowedCPUs=0-7,16-23
      elif [ "$2" == "release" ]; then
        systemctl set-property --runtime -- system.slice AllowedCPUs=0-31
        systemctl set-property --runtime -- user.slice AllowedCPUs=0-31
        systemctl set-property --runtime -- init.scope AllowedCPUs=0-31
      fi
    fi
  '';
in {
  systemd.tmpfiles.rules = [ "L+ /var/lib/libvirt/hooks/qemu - - - - ${qemuHook}" ];
}
