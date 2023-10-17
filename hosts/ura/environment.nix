{ inputs, pkgs, ... }: {
  environment = {
    pathsToLink = [ "/share/bash-completion" ];
    variables.EDITOR = "nano";

    shells = with pkgs; [
      bash
      nushell
    ];

    etc = {
      "nix/path/nixpkgs".source = inputs.nixpkgs;
      "nix/path/nixpkgs-unstable".source = inputs.nixpkgs-unstable;
      "nix/path/active-config".source = inputs.self;
    };

    systemPackages = with pkgs; [
      lm_sensors
      pciutils
      usbutils
      gptfdisk
      htop
      nload
      gnupg
      direnv
      home-manager
    ];
  };
}
