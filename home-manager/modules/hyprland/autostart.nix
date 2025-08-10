{ pkgs, config, lib, ... }: {
  wayland.windowManager.hyprland.settings = {
    "exec-once" = [
      "waybar"
      "openrgb"
    ];
  };
}
