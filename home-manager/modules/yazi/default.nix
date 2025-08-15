{ pkgs, ... }: {

  programs.yazi = {
    enable = true;

    enableZshIntegration = true;
    enableBashIntegration = true;
    enableFishIntegration = true;

    settings = {
      mgr = {
        ratio = [ 1 4 3 ];
        sort_by = "alphabetical";
        sort_sensitive = false;
        sort_reverse = false;
        sort_dir_first = true;
        sort_translit = false;
        linemode = "none";
        show_hidden = true;
        show_symlink = true;
        scrolloff = 5;
        mouse_events = [ "click" "scroll" ];
        title_format = "Yazi: {cwd}";
      };

      preview = {
        wrap = "yes";
        tab_size = 2;
        max_width = 600;
        max_height = 900;
        cache_dir = "";
        image_delay = 30;
        image_filter = "triangle";
        image_quality = 90;
        sixel_fraction = 15;
        ueberzug_scale = 1;
        ueberzug_offset = [ 0 0 0 0 ];
      };
    };
  };
}
