{ pkgs, ... }: {
  users.users.mado = {
    shell = pkgs.ion;
    extraGroups = [ "kvm" "rtkit" ];
  };
}
