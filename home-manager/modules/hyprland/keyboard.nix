{ pkgs, config, lib, ... }: {
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = "us";
      numlock_by_default = true;
      follow_mouse = true;            # changed from 1 to true
      mouse_refocus = false;
      accel_profile = "flat";
      force_no_accel = true;
      touchpad = {
        natural_scroll = false;
        scroll_factor = 1.0;
      };
      sensitivity = 0;
    };
  };
}
