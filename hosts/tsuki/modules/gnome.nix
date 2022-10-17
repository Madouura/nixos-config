{
  services.xserver = {
    digimend.enable = true;
    videoDrivers = [ "amdgpu" "nvidia" ];

    deviceSection = ''
      Option "TearFree"        "true"
      Option "VariableRefresh" "true"
    '';
  };
}
