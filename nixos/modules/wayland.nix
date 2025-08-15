{ pkgs, ... }: {

	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
		portalPackage = pkgs.xdg-desktop-portal-gtk;
	};

	environment.systemPackages = with pkgs; [
		ghostty

		hyprpicker
		grim
		slurp
		swaylock
    hyprlock
		swaynotificationcenter
		waypaper
		waybar
    swww

		gnome-keyring
		cliphist
		wl-clipboard

		xdg-desktop-portal
		xdg-desktop-portal-gtk
		xdg-desktop-portal-hyprland
	];

	environment.sessionVariables = {
		GTK_USE_PORTAL = "0";
		GDK_BACKEND = "wayland,x11";
		SDL_VIDEODRIVER = "wayland";
		CLUTTER_BACKEND = "wayland";
		QT_QPA_PLATFORMTHEME = "qt5ct";
		ELECTRON_OZONE_PLATFORM_HINT = "wayland";
		XDG_SESSION_TYPE = "wayland";
		NIXOS_OZONE_WL = "1";
	};

	xdg = {
		portal = {
			xdgOpenUsePortal = true;
			config = {
				common.default = [ "gtk" "hyprland" ];
				hyprland.default = [ "gtk" "hyprland" ];
			};
			extraPortals = with pkgs; [
				xdg-desktop-portal-gtk
				xdg-desktop-portal-hyprland
			];
		};
	};

	xdg.mime.defaultApplications = {
		"text/html" = "brave-browser.desktop";
		"image/*" = "eog.desktop";
		"video/*" = "mpv.desktop";
		"inode/directory" = "org.gnome.Nautilus.desktop";
	};
}
