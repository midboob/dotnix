{ pkgs, ... }:

let
  programs = import ./programs.nix;
in
{
  wayland.windowManager.hyprland.settings =
    programs // {
			"$mod" = "SUPER";

      bind = [
				## ───── Applications ─────
				"$mod, RETURN, exec, $terminal"
				"$mod, B, exec, $browser"
				"$mod, E, exec, $file-manager"
				"$mod SHIFT, E, exec, $alter-file-manager"
				"$mod, M, exec, $music"
				"$mod , O, exec, obsidian"
				"$mod, P, exec, $pdf"
				"$mod, N, exec, $editor"
				"$mod, Y, exec, $launcher-scripts/clipboard/clipboard"
				"$mod SHIFT, B, exec, overskride"
				"$mod SHIFT, N, exec, swaync-client -t -sw"

				## ───── Launcher / Menu ─────
				"$mod, SPACE, exec, $launcher"
				"$mod SHIFT, W, exec, ${./wallpaper.sh}"

				## ───── Session / Utilities ─────
				"$mod , ESCAPE, exec, $scripts/wlogout"
				"$mod SHIFT, R, exec, ${./reload.sh}"
				"$mod SHIFT, M, exec, spicetify apply"
				"$mod SHIFT, EQUAL, exec, $scripts/hyprsunset"
				"$mod SHIFT, Q, exec, hyprctl activewindow | grep pid | tr -d 'pid:'| xargs kill"

				## ───── Screenshot ─────
				"$mod SHIFT, S, exec, ${./screenshot.sh}"
				", Print, exec, ${pkgs.grim}/bin/grim - | ${pkgs.wl-clipboard}/bin/wl-copy && ${pkgs.wl-clipboard}/bin/wl-paste > ~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png"

				## ───── Window Management ─────
				"$mod, H, movefocus, l"
				"$mod, L, movefocus, r"
				"$mod, J, movefocus, d"
				"$mod, K, movefocus, u"

				"$mod CTRL, H, movewindow, l"
				"$mod CTRL, L, movewindow, r"
				"$mod CTRL, J, movewindow, d"
				"$mod CTRL, K, movewindow, u"
      ]

      ++ (
        builtins.concatLists (builtins.genList (i:
          let ws = i + 1;
          in [
            "$mod, code:1${toString i}, workspace, ${toString ws}"
            "$mod SHIFT, code:1${toString i}, movetoworkspacesilent, ${toString ws}"
          ])
        9)
      );

			bindr = [
				"$mod, SPACE, exec, $launcher"
			];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      binde = [
        "$mod SHIFT, H, resizeactive,-50 0"
        "$mod SHIFT, L, resizeactive,50 0"
        "$mod SHIFT, J, resizeactive,0 -50"
        "$mod SHIFT, K, resizeactive,0 50"
      ];
      bindel = [
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];
      bindl = [
        ",XF86AudioNext, exec, playerctl next"
        ",XF86AudioPause, exec, playerctl play-pause"
        ",XF86AudioPlay, exec, playerctl play-pause"
        ",XF86AudioPrev, exec, playerctl previous"
      ];
    };
}
