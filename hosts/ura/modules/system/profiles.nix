{ inputs, ... }:

{
  imports = [
    "${inputs.self}/profiles/users/mado.nix"
    "${inputs.self}/profiles/common.nix"
    "${inputs.self}/profiles/corectrl.nix"
    "${inputs.self}/profiles/fonts.nix"
    "${inputs.self}/profiles/gamemode.nix"
    "${inputs.self}/profiles/garbage-collection.nix"
    "${inputs.self}/profiles/gdm.nix"
    "${inputs.self}/profiles/gnome.nix"
    "${inputs.self}/profiles/ledger.nix"
    "${inputs.self}/profiles/monero.nix"
    "${inputs.self}/profiles/nano.nix"
    "${inputs.self}/profiles/pipewire.nix"
    "${inputs.self}/profiles/power-management.nix"
    "${inputs.self}/profiles/printing.nix"
    "${inputs.self}/profiles/steam.nix"
    "${inputs.self}/profiles/timesyncd.nix"
    "${inputs.self}/profiles/tor.nix"
    "${inputs.self}/profiles/zram.nix"
  ];
}
