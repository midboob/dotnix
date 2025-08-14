{
  wayland.windowManager.hyprland.settings = {

		workspace = "1, monitor:DP-6";

    windowrule = [
      # Picture-in-Picture PART 1
      "pin, title:^(Picture-in-Picture)$"
      "keepaspectratio, title:^(Picture-in-Picture)$"
      "float, title:^(Picture-in-Picture)$"

      # Calculator PART 1
      "float, class:^(org.gnome.Calculator)$"

      # Waypaper
      "float, class:^(waypaper)$"

      # XWayland video bridge fix
      "opacity 0.0 override, class:^(xwaylandvideobridge)$"
      "noanim, class:^(xwaylandvideobridge)$"
      "noinitialfocus, class:^(xwaylandvideobridge)$"
      "maxsize 1 1, class:^(xwaylandvideobridge)$"
      "noblur, class:^(xwaylandvideobridge)$"
      "nofocus, class:^(xwaylandvideobridge)$"

      # Ignore maximize requests from apps
      "suppressevent maximize, class:.*"
      # Fix some dragging issues with XWayland
      "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
    ];

    windowrulev2 = [
      # Picture-in-Picture PART 2
      "rounding 0, title:^(Picture-in-Picture)$"
      "noborder, title:^(Picture-in-Picture)$"
      "noshadow, title:^(Picture-in-Picture)$"

      # Calculator PART 2
      "size 400 600, class:^(org.gnome.Calculator)$"

      # windowrule - float popups and dialogue 
      "float, title:^(Authentication Required)$"
      "center, title:^(Authentication Required)$"
      "center, title:^(Open File)(.*)$"
      "center, title:^(Select a File)(.*)$"
      "center, title:^(Choose wallpaper)(.*)$"
      "center, title:^(Open Folder)(.*)$"
      "center, title:^(Save As)(.*)$"
      "center, title:^(Library)(.*)$"
      "center, title:^(File Upload)(.*)$"
      "float, title:^(Open File)(.*)$"
      "float, title:^(Select a File)(.*)$"
      "float, title:^(Choose wallpaper)(.*)$"
      "float, title:^(Open Folder)(.*)$"
      "float, title:^(Save As)(.*)$"
      "float, title:^(Library)(.*)$"
      "float, title:^(File Upload)(.*)$"

			# Always float
			"float, center, class:^(waypaper)$"
			"float, center, class:^(steam|Steam)$"
			"float, center, class:^(io.github.kaii_lb.Overskride)$"
			"float, center, class:^(nm-connection-editor)$"
			"float, center, class:^(org.gnome.Calculator)$"
			"float, center, class:^(openrgb)$"
			"float, center, class:^(heroic)$"
			"float, center, class:^(nwg-look)$"
    ];

		layerrule = [];
  };
}
