{ inputs, ... }: {
  age.secrets = {
    ura_monitors = {
      file = "${inputs.self}/secrets/ura_monitors.xml.age";
      path = "/run/gdm/.config/monitors.xml";
      group = "gdm";
      mode = "440";
    };
  };
}
