{ pkgs, config, lib, ... }: {
  wayland.windowManager.hyprland.settings = {

    windowrulev2 = [
      "float, title:^(Picture-in-Picture)$"
      "pin, title:^(Picture-in-Picture)$"
      "move 69.5% 4%, title:^(Picture-in-Picture)$"

      "float, center, title:^(Open file|Open|Save|Save as|Export|Import|Choose file|Rename), class:^(*)$"
      "float, center, class:(xdg-desktop-portal-gtk)"
      "float, center, class:(xdg-desktop-portal-hyprland)"
      "float, center, class:(Xdg-desktop-portal-gtk)"
      "float, center, class:(Xdg-desktop-portal-hyprland)"
      "noborder, class:(xdg-desktop-portal-gtk)"
      "float, class:brave, title:.*wants to save.*"

      # always float
      "float, center, class:^(waypaper)$"
      "float, center, class:^(steam|Steam)$"
      "float, center, class:^(io.github.kaii_lb.Overskride)$"
      "float, center, class:^(nm-connection-editor)$"
      "float, center, class:^(org.gnome.Calculator)$"
      "float, center, class:^(openrgb)$"
      "float, center, class:^(heroic)$"
      "float, center, class:^(nwg-look)$"
    ];

    windowrule = [
      "idleinhibit fullscreen,class:([window])"
    ];

    layerrule = [
      # rofi
      "animation slide, rofi"
      "dimaround, rofi"

      # waybar
      "order 1, waybar"

      # wlogout
      "blur, logout_dialog"
      "xray 0, logout_dialog"

      # swaync
      "xray 0, swaync-control-center"
      "xray 0, swaync-notification-window"
      "blur, swaync-control-center"
      "blur, swaync-notification-window"
      "ignorezero, swaync-control-center"
      "ignorezero, swaync-notification-window"
      "ignorealpha 0.5, swaync-control-center"
      "ignorealpha 0.5, swaync-notification-window"
    ];

    workspace = [
      "1, monitor:DP-3"
    ];

  };
}
