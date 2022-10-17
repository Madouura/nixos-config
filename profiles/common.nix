{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [ git ];

  nix = {
    package = pkgs.nixUnstable;
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    registry.nixpkgs.flake = inputs.nixpkgs;

    trustedUsers = [
      "root"
      "@wheel"
    ];

    extraOptions = let
      empty_registry = builtins.toFile "empty-flake-registry.json" ''{"flakes":[],"version":2}'';
    in ''
        experimental-features = nix-command flakes
        flake-registry = ${empty_registry}
        builders-use-substitutes = true
      '';
  };
}
