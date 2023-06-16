{ pkgs, ... }: {
  users.users = {
    qemu-libvirtd.extraGroups = [
      "users"
      "kvm"
    ];

    mado = {
      isNormalUser = true;
      description = "Madoura";
      shell = pkgs.zsh;

      extraGroups = [
        "wheel"
        "kvm"
        "rtkit"
        "video"
        "render"
        "audio"
        "corectrl"
        "gamemode"
        "libvirtd"
      ];
    };
  };
}
