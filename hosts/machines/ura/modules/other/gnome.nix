{
  services.xserver = {
    # digimend.enable = true; # TODO: FIXME
    videoDrivers = [ "amdgpu" ];

    deviceSection = ''
      Option "TearFree"        "true"
      Option "VariableRefresh" "true"
    '';
  };
}
