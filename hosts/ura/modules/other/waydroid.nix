{ config, ... }:

{
  virtualisation = {
    waydroid.enable = true;
    lxd.enable = !config.virtualisation.libvirtd.enable;
  };
}
