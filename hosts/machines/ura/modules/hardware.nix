{
  hardware = {
    enableRedistributableFirmware = true;
    bluetooth.enable = true;
    xone.enable = true;
    opengl.enable = true;
    amdgpu.loadInInitrd = false; # Do it manually for VFIO.
  };
}
