{
  virtualisation.libvirtd = {
    enable = true;
    onBoot = "ignore";
    onShutdown = "shutdown";

    qemu = {
      ovmf.enable = true;
      swtpm.enable = true;
      runAsRoot = false;

      verbatimConfig = ''
        namespaces = []

        cgroup_device_acl = [
          "/dev/input/by-id/usb-Logitech_G915_WIRELESS_RGB_MECHANICAL_GAMING_KEYBOARD_F45C52FA-event-kbd",
          "/dev/input/by-id/usb-Logitech_USB_Receiver-if02-event-mouse",
          "/dev/null", "/dev/full", "/dev/zero",
          "/dev/random", "/dev/urandom",
          "/dev/ptmx", "/dev/kvm", "/dev/kqemu",
          "/dev/rtc","/dev/hpet", "/dev/sev",
          "/dev/kvmfr0"
        ]
      '';
    };
  };
}
