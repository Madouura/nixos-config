{ pkgs-bcachefs }: final: prev: {
  inherit (pkgs-bcachefs)
    linuxKernel
    linuxPackages
    linuxPackages_testing
    linux_testing
    linuxPackages_testing_bcachefs
    linux_testing_bcachefs;
}
