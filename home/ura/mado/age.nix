{ config, inputs, ... }: {
  age = {
    identityPaths = [ "${config.home.homeDirectory}/.ssh/nix_id_ed25519" ];

    secrets = {
      "mado_ura_git_email".file = "${inputs.self}/secrets/mado_ura_git_email.inc.age";
    };
  };
}
