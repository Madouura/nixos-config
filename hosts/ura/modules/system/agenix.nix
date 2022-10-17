{ inputs, ... }:

{
  age.secrets = {
    avatar.file = "${inputs.self}/secrets/avatar.png.age";
    gdm.file = "${inputs.self}/secrets/gdm.age";
    monero_pubaddr.file = "${inputs.self}/secrets/monero_pubaddr.age";
    ura_monitors.file = "${inputs.self}/secrets/ura_monitors.xml.age";
  };
}
