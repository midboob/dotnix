{ pkgs, config, lib, ... }: {
	wayland.windowManager.hyprland.settings = {
		monitor = [ 
			"DP-6,1920x1080@144,0x0,1"
			"HDMI-A-2,1920x1080@60,1920x0,1"
		];
	};
}
