{
  hardware.pulseaudio.enable = false;

  environment.etc = {
    "wireplumber/bluetooth.lua.d/51-bluez-config.lua".text = ''
      bluez_monitor.properties = {
        ["bluez5.enable-sbc-xq"] = true,
        ["bluez5.enable-msbc"] = true,
        ["bluez5.enable-hw-volume"] = true,
        ["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
      }
    '';

    "wireplumber/alsa.lua.d/51-alsa-monitor.lua".text = ''
      rules = {
        {
          matches = [{ node.name = "alsa_output.usb-Schiit_Audio_Schiit_Unison_Modius-00.iec958-stereo" }],

          actions = {
            update-props = {
              audio.format = "S24_3LE",
              audio.rate = 192000,
              api.alsa.period-size = 256
            }
          }
        }

        {
          matches = [{ node.name = "alsa_input.usb-Focusrite_Scarlett_Solo_USB_Y7DZDPB160B058-00.iec958-stereo" }],

          actions = {
            update-props = {
              audio.format = "S32_LE",
              audio.rate = 48000,
              api.alsa.period-size = 256
            }
          }
        }
      }
    '';
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    jack.enable = true;

    alsa = {
      enable = true;
      support32Bit = true;
    };

    config = {
      pipewire = {
        "context.properties" = {
          "link.max-buffers" = 16; # version < 3 clients can't handle more than this
          "log.level" = 2;
          "default.clock.rate" = 192000;
          "default.clock.min-quantum" = 256;
          "default.clock.max-quantum" = 256;
          "core.daemon" = true;
          "core.name" = "pipewire-0";
        };

        "context.modules" = [
          {
            name = "libpipewire-module-rtkit";
            flags = [ "ifexists" "nofail" ];

            args = {
              "nice.level" = -15;
              "rt.prio" = 88;
              "rt.time.soft" = 200000;
              "rt.time.hard" = 200000;
            };
          }

          { name = "libpipewire-module-protocol-native"; }
          { name = "libpipewire-module-profiler"; }
          { name = "libpipewire-module-metadata"; }
          { name = "libpipewire-module-spa-device-factory"; }
          { name = "libpipewire-module-spa-node-factory"; }
          { name = "libpipewire-module-client-node"; }
          { name = "libpipewire-module-client-device"; }

          {
            name = "libpipewire-module-portal";
            flags = [ "ifexists" "nofail" ];
          }

          {
            name = "libpipewire-module-access";
            args = { };
          }

          { name = "libpipewire-module-adapter"; }
          { name = "libpipewire-module-link-factory"; }
          { name = "libpipewire-module-session-manager"; }
        ];
      };

      pipewire-pulse = {
        "context.properties" = {
          "log.level" = 2;
        };

        "context.modules" = [
          {
            name = "libpipewire-module-rtkit";
            flags = [ "ifexists" "nofail" ];

            args = {
              "nice.level" = -15;
              "rt.prio" = 88;
              "rt.time.soft" = 200000;
              "rt.time.hard" = 200000;
            };
          }

          { name = "libpipewire-module-protocol-native"; }
          { name = "libpipewire-module-client-node"; }
          { name = "libpipewire-module-adapter"; }
          { name = "libpipewire-module-metadata"; }

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
          "resample.quality" = 4;
          "node.latency" = "256/192000";
        };
      };

      jack = {
        "context.properties" = {
          "log.level" = 2;
        };

        "jack.properties" = {
          "node.latency" = "256/192000";
          "node.rate" = "1/192000";
          "node.quantum" = "256/192000";
        };

        "context.modules" = [
          {
            name = "libpipewire-module-rtkit";
            flags = [ "ifexists" "nofail" ];

            args = {
              "nice.level" = -15;
              "rt.prio" = 88;
              "rt.time.soft" = 200000;
              "rt.time.hard" = 200000;
            };
          }

          { name = "libpipewire-module-protocol-native"; }
          { name = "libpipewire-module-client-node"; }
          { name = "libpipewire-module-metadata"; }
        ];
      };
    };
  };
}
