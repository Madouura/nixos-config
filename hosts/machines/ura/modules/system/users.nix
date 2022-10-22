{ pkgs, ... }: {
  users.users.mado = {
    shell = pkgs.zsh;
    extraGroups = [ "kvm" "rtkit" ];
  };
}
