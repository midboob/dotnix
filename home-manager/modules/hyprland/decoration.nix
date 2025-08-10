{ pkgs, config, lib, ... }: {
  wayland.windowManager.hyprland.settings = {
    decoration = {
      rounding = 7;
      active_opacity = 1.0;
      inactive_opacity = 0.9;
      fullscreen_opacity = 1.0;

      blur = {
        enabled = true;
        size = 6;
        passes = 2;
        new_optimizations = "on"; # must be a string, not a bare identifier
        ignore_opacity = true;
        xray = false;
        popups = true;
        special = true;
      };

      shadow = {
        enabled = true;
        range = 5;
        render_power = 2;
        color = "$shadow"; # OK to keep this as a string with a $
        # color = "rgba(0,0,0,0.5)";
        # color_inactive = "$shadow";
      };
    };
  };
}
