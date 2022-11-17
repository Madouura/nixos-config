{
  hardware.pulseaudio.enable = false;

  environment.etc = {
    "wireplumber/bluetooth.lua.d/51-bluez-config.lua".text = ''
      bluez_monitor.properties = {
        ["bluez5.enable-sbc-xq"] = true,
        ["bluez5.enable-msbc"] = true,
        ["bluez5.enable-hw-volume"] = true,
        ["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
      };
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
          "link.max-buffers" = 64;
          "log.level" = 2;
          "default.clock.min-quantum" = 256;
          "default.clock.quantum" = 256;
          "default.clock.max-quantum" = 256;
          "core.daemon" = true;
          "core.name" = "pipewire-0";
        };

        "context.spa-libs" = {
          "audio.convert.*" = "audioconvert/libspa-audioconvert";
          "avb.*" = "avb/libspa-avb";
          "api.alsa.*" = "alsa/libspa-alsa";
          "api.v4l2.*" = "v4l2/libspa-v4l2";
          "api.libcamera.*" = "libcamera/libspa-libcamera";
          "api.bluez5.*" = "bluez5/libspa-bluez5";
          "api.vulkan.*" = "vulkan/libspa-vulkan";
          "api.jack.*" = "jack/libspa-jack";
          "support.*" = "support/libspa-support";
        };

        "context.modules" = [
          {
            name = "libpipewire-module-rtkit";
            flags = [ "ifexists" "nofail" ];

            args = {
              "nice.level" = -11;
              "rt.prio" = 88;
              "rt.time.soft" = -1;
              "rt.time.hard" = -1;
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

        "context.objects" = [
          {
            factory = "spa-node-factory";

            args = {
                "factory.name"    = "support.node.driver";
                "node.name"       = "Dummy-Driver";
                "node.group"      = "pipewire.dummy";
                "priority.driver" = 20000;
            };
          }

          {
            factory = "spa-node-factory";

            args = {
                "factory.name"    = "support.node.driver";
                "node.name"       = "Freewheel-Driver";
                "priority.driver" = 19000;
                "node.group"      = "pipewire.freewheel";
                "node.freewheel"  = true;
            };
          }
        ];
      };

      pipewire-pulse = {
        "context.properties" = {
          "log.level" = 2;
        };

        "context.spa-libs" = {
          "audio.convert.*" = "audioconvert/libspa-audioconvert";
          "support.*" = "support/libspa-support";
        };

        "context.modules" = [
          {
            name = "libpipewire-module-rtkit";
            flags = [ "ifexists" "nofail" ];

            args = {
              "nice.level" = -11;
              "rt.prio" = 88;
              "rt.time.soft" = -1;
              "rt.time.hard" = -1;
            };
          }

          { name = "libpipewire-module-protocol-native"; }
          { name = "libpipewire-module-client-node"; }
          { name = "libpipewire-module-adapter"; }
          { name = "libpipewire-module-metadata"; }

          {
            name = "libpipewire-module-protocol-pulse";
            args = { };
          }
        ];

        "stream.properties" = {
          "resample.quality" = 10;
        };
      };

      jack = {
        "context.properties" = {
          "log.level" = 2;
        };

        "context.spa-libs" = {
          "support.*" = "support/libspa-support";
        };

        "context.modules" = [
          {
            name = "libpipewire-module-rtkit";
            flags = [ "ifexists" "nofail" ];

            args = {
              "rt.prio" = 88;
              "rt.time.soft" = -1;
              "rt.time.hard" = -1;
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
