{ pkgs, inputs, ... }:

{
  imports = [
    "${inputs.self}/packages/bcachefs.nix"
    "${inputs.self}/packages/gamescope.nix"
    "${inputs.self}/packages/ledger-live-desktop.nix"
    "${inputs.self}/packages/monero-cli.nix"
    "${inputs.self}/packages/monero-gui.nix"
    "${inputs.self}/packages/p2pool.nix"
    "${inputs.self}/packages/protonup.nix"
    "${inputs.self}/packages/rpcs3.nix"
    "${inputs.self}/packages/virtiofsd.nix"
    "${inputs.self}/packages/waydroid.nix"
    "${inputs.self}/packages/xmrig.nix"
  ];

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
