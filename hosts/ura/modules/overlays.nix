{ inputs, ... }:

let
  unstable = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux;
in {
  imports = [
    "${inputs.nixpkgs-unstable}/nixos/modules/virtualisation/waydroid.nix"
    "${inputs.nixpkgs-unstable}/nixos/modules/services/networking/monero.nix"
  ];

  disabledModules = [
    "virtualisation/waydroid.nix"
    "services/networking/monero.nix"
  ];

  nixpkgs.overlays = [
    (final: prev: {
      virtiofsd = unstable.virtiofsd;
      waydroid = unstable.waydroid;
      rpcs3 = unstable.rpcs3;
      gamescope = unstable.gamescope;
      p2pool = unstable.p2pool;
      xmrig = unstable.xmrig;
      monero-cli = unstable.monero-cli;
      monero-gui = unstable.monero-gui;
      ledger-live-desktop = unstable.ledger-live-desktop;
    })

    (final: prev: {
      protonup = prev.protonup.overrideAttrs (old: {
        src = prev.python3Packages.fetchPypi {
          pname = "protonup-ng";
          version = "0.2.1";
          sha256 = "005ixhyg2369kcdwvcxwrhfdyh0q9s6p0pyvhqlhxyxphqv3saxg";
        };
      });
    })
  ];
}
