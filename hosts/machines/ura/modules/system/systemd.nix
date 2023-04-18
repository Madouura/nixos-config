{ pkgs, ... }: {
  systemd.tmpfiles.rules = [
    "L+ /opt/amdgpu/share/libdrm/amdgpu.ids - - - - ${pkgs.libdrm}/share/libdrm/amdgpu.ids"
    "L+ /opt/rocm/hip - - - - ${pkgs.hip}"
  ];
}
