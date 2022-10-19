# { input, ... }: {
{
  programs.firefox = {
    enable = true;
    enableGnomeExtensions = true;

    # extensions = with input.nix-user-repository.repos.rycee.firefox-addons; [
      # gnome-shell-integration
      # ublock-origin
    # ];
  };
}
