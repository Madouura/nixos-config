{ osConfig, ... }:

{
  home.file."mining.sh" = {
    executable = true;
    target = "/home/mado/.local/bin/mining.sh";

    text = ''
      #!/usr/bin/env bash
      # Workaround
      export monero_pubaddr=${ osConfig.age.secrets.monero_pubaddr.path }
      cd /home/mado/.p2pool
      screen -dmS mining
      screen -X exec p2pool --mini --wallet $monero_pubaddr
      screen -X screen
      screen -X exec sudo xmrig -t 24 --randomx-1gb-pages -o 127.0.0.1:3333
      screen -r
    '';
  };
}
