{ pkgs, config, lib, ... }: {
  wayland.windowManager.hyprland.settings = {
    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      initial_workspace_tracking = true;  # changed from 1
      force_default_wallpaper = false;    # changed from 0
    };
    "ecosystem:no_update_news" = true;
  };
}
