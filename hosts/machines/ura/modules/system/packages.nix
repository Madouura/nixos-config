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
    inputs.agenix.packages.x86_64-linux.default
  ];
}
