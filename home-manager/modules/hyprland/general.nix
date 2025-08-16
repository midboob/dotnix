{ pkgs, config, lib, ... }: {
	wayland.windowManager.hyprland.settings = {
		monitor = [ 
			",highrr,0x0,1"
			"HDMI-A-2,1920x1080@70,1920x0,1"
		];

		exec-once = [
			# "${pkgs.waybar}/bin/waybar"
			# "${pkgs.swaynotificationcenter}/bin/swaync"
			"${pkgs.waypaper}/bin/waypaper --restore"

			# Set volume to #100%
			"sleep 4 && ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 1"
			"sleep 5 && ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 1"

			# Clipboard history
			"${pkgs.cliphist}/bin/cliphist wipe"
			"${pkgs.wl-clipboard}/bin/wl-paste --type text --watch ${pkgs.cliphist}/bin/cliphist store"
		];

		general =  {
			"gaps_in" = 3;
			"gaps_out" = 5;
			"gaps_workspaces" = 50;

			"border_size" = 2;

			"col.active_border" = lib.mkForce "rgb(${config.stylix.base16Scheme.base0A})";
			"col.inactive_border" = lib.mkForce "rgb(${config.stylix.base16Scheme.base01})";

			"layout" = "dwindle";
		};

		decoration = {
			"rounding" = 0;
			"active_opacity" = 1;
			"inactive_opacity" = 0.9;
			"fullscreen_opacity" = 1;

			blur = {
				"enabled" = true;
				"size" = 6;
				"passes" = 2;
				"new_optimizations" = true;
				"ignore_opacity" = true;
				"xray" = false;
				"popups" = true;
				"special" = true;
			};

			shadow = {
				"enabled" = true;
				"range" = 5;
				"render_power" = 2;
				"color" = lib.mkDefault "rgba(1a1a1aee)"; # Fallback
			};
		};

		animations = {
			"enabled" = true;
			"first_launch_animation" = true;

			bezier = [
				"easeOutQuint,0.23,1,0.32,1"
				"easeInOutCubic,0.65,0.05,0.36,1"
				"linear,0,0,1,1"
				"almostLinear,0.5,0.5,0.75,1.0"
				"quick,0.15,0,0.1,1"
			];

			animation = [
				"global, 1, 10, default"
				"border, 1, 5.39, easeOutQuint"
				"windows, 1, 4.79, easeOutQuint"
				"windowsIn, 1, 4.1, easeOutQuint, popin 87%"
				"windowsOut, 1, 1.49, linear, popin 87%"
				"fadeIn, 1, 1.73, almostLinear"
				"fadeOut, 1, 1.46, almostLinear"
				"fade, 1, 3.03, quick"
				"layers, 1, 3.81, easeOutQuint"
				"layersIn, 1, 4, easeOutQuint, fade"
				"layersOut, 1, 1.5, linear, fade"
				"fadeLayersIn, 1, 1.79, almostLinear"
				"fadeLayersOut, 1, 1.39, almostLinear"
				"workspaces, 1, 1.94, almostLinear, fade"
				"workspacesIn, 1, 1.21, almostLinear, fade"
				"workspacesOut, 1, 1.94, almostLinear, fade"
			];
		};

		dwindle = {
			"preserve_split" = true;
			"pseudotile" = true;
		};

		misc = {
			"force_default_wallpaper" = 0;
			"disable_hyprland_logo" = false;
    	"disable_splash_rendering" = true;
    	"initial_workspace_tracking" = 1;
		};

		input = {
			"kb_layout" = [ "us" ];
			"follow_mouse" = 1;
			"sensitivity" = 0;
			"numlock_by_default" = true;
			"accel_profile" = "flat";
			"force_no_accel" = true;

			touchpad = {
				"natural_scroll" = false;
				"scroll_factor" = 1;
			};
		};
	};
}
