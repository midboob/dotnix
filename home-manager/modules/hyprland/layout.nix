{ pkgs, config, lib, ... }: {
  wayland.windowManager.hyprland.settings = {

    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    master = {
      # new_status = "master";  # Optional: uncomment if needed and valid
    };

    gestures = {
      workspace_swipe = false;
    };

    binds = {
      workspace_back_and_forth = true;
      allow_workspace_cycles = true;
      movefocus_cycles_fullscreen = true;
      pass_mouse_when_bound = false;
    };

  };
}
