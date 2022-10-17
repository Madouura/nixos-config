{ config, ... }:

{
  systemd.tmpfiles.rules = [
    "L+ /var/lib/AccountsService/users/mado - - - - ${ config.age.secrets.gdm.path }"
    "L+ /var/lib/AccountsService/icons/mado - - - - ${ config.age.secrets.avatar.path }"
  ];
}
