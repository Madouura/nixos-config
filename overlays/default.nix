{ pkgs-unstable, pkgs-bcachefs }: [
  (import ./bcachefs.nix { inherit pkgs-bcachefs; })
  (import ./discord.nix { inherit pkgs-unstable; })
  (import ./gamescope.nix { inherit pkgs-unstable; })
  (import ./linux.nix { inherit pkgs-bcachefs; })
]
