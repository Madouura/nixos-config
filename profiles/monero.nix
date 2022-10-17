{
  services.monero = {
    enable = true;

    extraConfig = ''
      zmq-pub=tcp://127.0.0.1:18083
    '';
  };
}
