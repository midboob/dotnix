{ pkgs, config, lib, ... }: {
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 3;
      gaps_out = 5;
      border_size = 2;
      "col.active_border" = "$inverse_primary";
      "col.inactive_border" = "$background";
      # "col.active_border" = "$color6";
      # "col.inactive_border" = "$color5";
      layout = "dwindle";
      resize_on_border = true;
    };
  };
}
