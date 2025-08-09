{ pkgs, ... }: {

	environment.systemPackages = with pkgs; [

		# Desktop apps
		obs-studio
		pavucontrol
		overskride
		anki-bin
		bleachbit
		gimp
		obsidian
		steam
		vesktop
		zathura
		mpv
		qbittorrent
		kitty
		ghostty
		brave
		rofi
		stow
		nautilus
		networkmanagerapplet
		switcheroo
		wlogout
		localsend
		openrgb
		waybar


		# CLI
		brightnessctl
		ani-cli
		wl-clipboard
		bluetui
		oh-my-posh
		eza
		yazi
                neovim
		bat
		btop
		cava
		curl
		fastfetch
		ffmpeg
		file
		fzf
		git
		killall
		lazydocker
		lazygit
		ncdu
		ntfs3g
		progress
		ripgrep
		tmux
		tree
		unzip
		watch
		wget
		zip
		lua
		gh
		sl

		steam-run

		# Other
		gcc
		clang
		zig
		home-manager
	];

	fonts.packages = with pkgs; [
		dina-font
		fira-code
		fira-code-symbols
		liberation_ttf
		mplus-outline-fonts.githubRelease
		nerd-fonts.fira-code
		nerd-fonts.symbols-only
		noto-fonts
		noto-fonts-cjk-sans
		noto-fonts-emoji
		proggyfonts
	];
}
