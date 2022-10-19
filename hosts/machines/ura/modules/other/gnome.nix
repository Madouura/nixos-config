{
  services.xserver = {
    digimend.enable = true;
    videoDrivers = [ "amdgpu" ];

    deviceSection = ''
      Option "TearFree"        "true"
      Option "VariableRefresh" "true"
    '';
  };
}
