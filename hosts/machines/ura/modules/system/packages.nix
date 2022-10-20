{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    lm_sensors
    pciutils
    usbutils
    htop
    nload
    ebtables
    dnsmasq
    screen
    inputs.agenix.defaultPackage.x86_64-linux
  ];
}