{ config, pkgs, ... }: {
  home.file."mining.sh" = {
    executable = true;

    text = ''
      #!${ pkgs.runtimeShell }
      mkdir -p ~/.p2pool
      cd ~/.p2pool
      rm p2pool.log
      screen -dmS mining
      screen -X exec p2pool --mini --wallet $(cat ${ config.homeage.file."monero_pubaddr".path })
      until [ -f p2pool.log ]; do sleep 1; done
      tail -f p2pool.log | sed '/SYNCHRONIZED/ q'
      screen -X screen
      screen -X exec sudo xmrig -t 24 --randomx-1gb-pages -o 127.0.0.1:3333
      screen -r
    '';
  };
}
