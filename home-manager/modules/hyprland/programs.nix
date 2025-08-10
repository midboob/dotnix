{ pkgs, config, lib, ... }: {
  wayland.windowManager.hyprland.settings = {
    "$browser" = "brave-browser-nightly";
    "$music" = "spotify";
    "$terminal" = "ghostty";
    "$file-manager" = "$terminal -e yazi";
    "$alter-file-manager" = "nautilus";
    "$launcher" = "rofi -show drun";
    "$editor" = "$terminal -e nvim";
    "$pdf" = "zathura";
  };
}
