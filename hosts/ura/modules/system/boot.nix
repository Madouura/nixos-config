{
  boot = {
    kernelModules = [ "nct6775" "jc42" ];
    kernel.sysctl = { "kernel.sysrq" = 1; };
    initrd.availableKernelModules = [ "amdgpu" ];

    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
  };
}
