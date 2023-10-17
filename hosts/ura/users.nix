{ pkgs, ... }: {
  users.users.mado = {
    isNormalUser = true;
    description = "Madoura";
    shell = pkgs.nushell;

    extraGroups = [
      "wheel"
      "corectrl"
      "gamemode"
      "video"
    ];
  };
}
