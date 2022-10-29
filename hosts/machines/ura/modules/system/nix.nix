{
  nix.settings.extra-sandbox-paths = [
    "/dev/kfd"
    "/sys/devices/virtual/kfd"
    "/dev/dri/renderD128"
    "/dev/dri/renderD129"
  ];
}
