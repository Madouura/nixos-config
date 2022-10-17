{
  home.file."mining.sh" ={
    executable = true;
    target = "$HOME/.local/bin/mining.sh";

    text = ''
      cd /home/mado/.p2pool
      screen -dmS mining
      screen -X exec p2pool --mini --wallet ${builtins.readFile /etc/nixos/resources/monero_pubaddr}
      screen -X screen
      screen -X exec sudo xmrig -t 24 --randomx-1gb-pages -o 127.0.0.1:3333
      screen -r
    '';
  };
}
