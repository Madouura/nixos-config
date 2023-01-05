{ pkgs-unstable, ... }: {
  nixpkgs.overlays = [(final: prev: {
    discord = pkgs-unstable.discord.override {
      withOpenASAR = true;
    };
  })];
}
