{
  environment.etc = {
    "wireplumber/alsa.lua.d/51-alsa-config.lua".text = ''
      apply_properties = {
        ["audio.format"] = "S24LE",
        ["audio.rate"] = 192000,
        ["api.alsa.period-size"] = 256,
      },
    '';
  };

  services.pipewire.config = {
    pipewire = {
      "context.properties" = {
        "default.clock.rate" = 192000;

        "default.clock.allowed-rates" = [
          44100
          48000
          88200
          96000
          176400
          192000
        ];
      };
    };

    pipewire-pulse = {
      "pulse.properties" = {
        "pulse.min.req" = "128/192000";
        "pulse.default.req" = "256/192000";
        "pulse.max.req" = "512/192000";
        "pulse.min.quantum" = "128/192000";
        "pulse.default.quantum" = "256/192000";
        "pulse.max.quantum" = "512/192000";
        "pulse.default.format" = "S24LE";
        "server.address" = [ "unix:native" ];
      };

      "stream.properties" = {
        "node.latency" = "256/192000";
      };
    };

    jack = {
      "jack.properties" = {
        "node.latency" = "256/192000";
        "node.rate" = "1/192000";
        "node.quantum" = "256/192000";
      };
    };
  };
}
