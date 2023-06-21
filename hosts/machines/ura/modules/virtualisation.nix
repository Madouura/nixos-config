{
  virtualisation.libvirtd = {
    enable = true;
    onBoot = "ignore";
    onShutdown = "shutdown";

    qemu = {
      ovmf.enable = true;
      swtpm.enable = true;
      runAsRoot = false;

      # cgroup_device_acl = [
      #   "/dev/null", "/dev/full", "/dev/zero",
      #   "/dev/random", "/dev/urandom",
      #   "/dev/ptmx", "/dev/kvm", "/dev/kqemu",
      #   "/dev/rtc","/dev/hpet", "/dev/sev",
      #   "/dev/kvmfr0"
      # ]
    };
  };
}
