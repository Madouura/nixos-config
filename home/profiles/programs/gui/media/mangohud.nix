{
  programs.mangohud = {
    enable = true;
    enableSessionWide = true;

    settings = {
      legacy_layout = false;
      gpu_stats = true;
      gpu_temp = true;
      gpu_mem_clock = true;
      gpu_load_change = true;
      gpu_load_value = "50,90";
      gpu_load_color = "FFFFFF,FF7800,CC0000";
      gpu_text = "GPU";
      cpu_stats = true;
      cpu_temp = true;
      cpu_load_change = true;
      core_load_change = true;
      cpu_load_value = "50,90";
      cpu_load_color = "FFFFFF,FF7800,CC0000";
      cpu_color = "2e97cb";
      cpu_text = "CPU";
      io_color = "a491d3";
      vram = true;
      vram_color = "ad64c1";
      ram = true;
      ram_color = "c26693";
      fps = true;
      engine_color = "eb5b5b";
      gpu_color = "2e9762";
      wine_color = "eb5b5b";
      frame_timing = 1;
      frametime_color = "00ff00";
      resolution = true;
      gamemode = true;
      media_player_color = "ffffff";
      background_alpha = "0.4";
      font_size = 24;
      background_color = "020202";
      position = "top-left";
      text_color = "ffffff";
      round_corners = 0;
      toggle_hud = "Shift_R+F12";
    };
  };
}
