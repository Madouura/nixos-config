{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    lm_sensors
    pciutils
    usbutils
    htop
    nload
    dnsmasq
    screen
    ledger-live-desktop
    blender
    hip
    inputs.agenix.packages.x86_64-linux.default
  ];
}
