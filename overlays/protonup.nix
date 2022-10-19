{ inputs, ... }: {
  nixpkgs.overlays = [(final: prev: {
    protonup = prev.protonup.overrideAttrs (old: {
      src = prev.python3Packages.fetchPypi {
        pname = "protonup-ng";
        version = "0.2.1";
        sha256 = "005ixhyg2369kcdwvcxwrhfdyh0q9s6p0pyvhqlhxyxphqv3saxg";
      };
    });
  })];
}
