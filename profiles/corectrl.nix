{
  # Add any users in the 'wheel' group to the 'corectrl' group
  users.groups.corectrl.members = builtins.filter (x: builtins.elem "wheel" config.users.users."${x}".extraGroups) (builtins.attrNames config.users.users);

  programs.corectrl.enable = true;
}
