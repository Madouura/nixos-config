{
  environment.etc = {
    "wireplumber/alsa.lua.d/51-alsa-monitor.lua".text = ''
      alsa_monitor.properties = {
        ["audio.format"] = "S24LE";
        ["audio.rate"] = 192000;
        ["api.alsa.period-size"] = 256;
      };
    '';
  };

  services.pipewire.config = {
    pipewire = {
      "context.properties" = {
        "default.clock.rate" = 192000;
      };
    };

    pipewire-pulse = {
      "context.modules" = [
        {
          name = "libpipewire-module-protocol-pulse";

          args = {
            "pulse.min.req" = "256/192000";
            "pulse.default.req" = "256/192000";
            "pulse.max.req" = "256/192000";
            "pulse.min.quantum" = "256/192000";
            "pulse.max.quantum" = "256/192000";
            "server.address" = [ "unix:native" ];
          };
        }
      ];

      "stream.properties" = {
        "node.latency" = "256/192000";
      };
    };
  };
}
