{ pkgs, inputs, ... }:

{
  imports = [
    ./disks.nix
    ./hardware-configuration.nix
    ./persistent.nix

    ./modules/corectrl.nix
    ./modules/fuse.nix
    ./modules/gamemode.nix
    ./modules/gnome.nix
    ./modules/libvirtd.nix
    ./modules/pipewire.nix
    ./modules/trusted-users.nix
    ./modules/waydroid.nix

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

  system.stateVersion = "22.05";
  nixpkgs.config.allowUnfree = true;
  time.timeZone = "America/Chicago";
  systemd.tmpfiles.rules = [ "L+ /run/gdm/.config/monitors.xml - - - - ${secrets.monitors}" ];
  users.users.mado.extraGroups = [ "kvm" "rtkit" ];

  nix = {
    # From flake-utils-plus
    generateNixPathFromInputs = true;
    generateRegistryFromInputs = true;
    linkInputs = true;
  };

  security = {
    rtkit.enable = true;

    pam.loginLimits = [
      {
        domain = "*";
        type = "hard";
        item = "memlock";
        value = "unlimited";
      }

      {
        domain = "*";
        type = "soft";
        item = "memlock";
        value = "unlimited";
      }
    ];
  };

  hardware = {
    enableRedistributableFirmware = true;
    bluetooth.enable = true;
    xone.enable = true;

    opengl.extraPackages = with pkgs; [
      rocm-opencl-icd
      rocm-opencl-runtime
    ];
  };

  networking = {
    hostName = "ura";
    networkmanager.enable = true;
    useDHCP = false;

    firewall = {
      allowedTCPPortRanges = [
        { from = 13370; to = 13379; }
        { from = 13380; to = 13389; }
      ];

      allowedUDPPortRanges = [
        { from = 13370; to = 13379; }
        { from = 13380; to = 13389; }
      ];
    };

    interfaces = {
      enp5s0.useDHCP = true;
      enp6s0.useDHCP = true;
      wlp7s0.useDHCP = true;
    };
  };

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
