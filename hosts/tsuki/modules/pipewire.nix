{
  environment.etc = {
    "wireplumber/alsa.lua.d/51-alsa-monitor.lua".text = ''
      alsa_monitor.properties = {
        ["audio.format"] = "S24LE";
        ["audio.rate"] = 44100;
        ["api.alsa.period-size"] = 256;
      };
    '';
  };

  services.pipewire.config = {
    pipewire = {
      "context.properties" = {
        "default.clock.rate" = 44100;
      };
    };

    pipewire-pulse = {
      "context.modules" = [
        {
          args = {
            "pulse.min.req" = "256/44100";
            "pulse.default.req" = "256/44100";
            "pulse.max.req" = "256/44100";
            "pulse.min.quantum" = "256/44100";
            "pulse.max.quantum" = "256/44100";
          };
        }
      ];

      "stream.properties" = {
        "node.latency" = "256/44100";
      };
    };
  };
}
