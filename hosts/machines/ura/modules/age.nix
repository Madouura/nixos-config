{ inputs, ... }: {
  age.secrets = {
    gdm_user = {
      file = "${inputs.self}/secrets/gdm.age";
      path = "/var/lib/AccountsService/users/mado";
      mode = "400";
    };

    gdm_avatar = {
      file = "${inputs.self}/secrets/avatar.jpg.age";
      path = "/var/lib/AccountsService/icons/mado";
      mode = "444";
    };

    ura_monitors = {
      file = "${inputs.self}/secrets/ura_monitors.xml.age";
      path = "/run/gdm/.config/monitors.xml";
      group = "gdm";
      mode = "440";
    };
  };
}
