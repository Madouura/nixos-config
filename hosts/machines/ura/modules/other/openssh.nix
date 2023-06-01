{
  services.openssh = {
    enable = true;
    ports = [ 19972 ];

    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };
}
