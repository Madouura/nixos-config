{ config, ... }: {
  # Add any users in the 'wheel' group to the 'gamemode' group
  users.groups.gamemode.members = builtins.filter (x: builtins.elem "wheel" config.users.users."${x}".extraGroups) (builtins.attrNames config.users.users);

  programs.gamemode = {
    enable = true;
    settings.general.renice = 10;
  };
}
