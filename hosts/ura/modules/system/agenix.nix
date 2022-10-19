{ inputs, ... }:

{
  age.secrets = {
    gdm_user = {
      file = "${inputs.self}/secrets/gdm.age";
      path = "/var/lib/AccountsService/users/mado";
      owner = "root";
      group = "gdm";
      mode = "440";
    };

    gdm_avatar = {
      file = "${inputs.self}/secrets/avatar.png.age";
      path = "/var/lib/AccountsService/icons/mado";
      owner = "root";
      group = "gdm";
      mode = "444";
    };

    ura_monitors = {
      file = "${inputs.self}/secrets/ura_monitors.xml.age";
      path = "/run/gdm/.config/monitors.xml";
      owner = "root";
      group = "gdm";
      mode = "440";
    };

    monero_pubaddr = {
      file = "${inputs.self}/secrets/monero_pubaddr.age";
      owner = "mado";
      mode = "400";
    };
  };
}
