{ pkgs, ... }:

{
  hardware = {
    enableRedistributableFirmware = true;
    bluetooth.enable = true;
    xone.enable = true;

    opengl.extraPackages = with pkgs; [
      rocm-opencl-icd
      rocm-opencl-runtime
    ];
  };
}
