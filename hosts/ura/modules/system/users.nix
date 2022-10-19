{
  users.users = {
    root.passwordFile = "/persist/resources/mado.password";

    mado = {
      passwordFile = "/persist/resources/mado.password";
      extraGroups = [ "kvm" "rtkit" ];
    };
  };
}
