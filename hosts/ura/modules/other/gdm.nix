{ config, ... }:

{
  systemd.tmpfiles.rules = [ "L+ /run/gdm/.config/monitors.xml - - - - ${ config.age.secrets.ura_monitors.path }" ];
}
