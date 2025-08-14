{ pkgs, ...}: {

	stylix.targets.zsh.enable = true;

	programs.zsh = {
		enable = true;
		enableCompletions = true;
		autosuggestions.enable = true;
		syntaxHighlighting.enable = true;

		shellAliases = {

			# Rebuilds
			nrs = "nh os switch";
			nrb = "nh os boot";
			hms = "nh home switch";

			# Nvim
			v = "nvim";
			vi = "nvim";
			vim = "nvim";

			# Tmux
			t = "tmux";
			
			# Eza
			ls = "eza --icons=auto --classify --group-directories-first --header --time-style=long-iso";
			la = "eza -la --icons=auto --classify --group-directories-first --header --time-style=long-iso";
			tree = "eza --tree --icons=auto --classify --group-directories-first --header --time-style=long-iso";

			# Common commands
			cp = "cp -iv";
			mv = "mv -iv";
			rm = "rm -vI";
			bc = "bc -ql";
			mkd = "mkdir -pv";

			# Git
			g = "git";
			gs = "git status";
			gc = "git commit";
			ga = "git add";
			gpl = "git pull";
			gpom = "git pull origin master";
			gpu = "git push";
			gpuom = "git push origin master";
			gd = "git diff --output-indicator-new=' ' --output-indicator-old=' '";
			gch = "git checkout";
			gnb = "git checkout -b";
			gac = "git add . && git commit";
			grs = "git restore --staged .";
			gre = "git restore";
			gr = "git remote";
			gcl = "git clone";
			gl = "git log --graph --abbrev-commit --decorate --format=format:'%C(bold green)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold yellow)(%ar)%C(reset)%C(auto)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all";
			gt = "git ls-tree -r master --name-only";
			grm = "git remote";
			gb = "git branch";
			gf="git fetch";

			# notes
			notes = "/mnt/Storage/Documents/notes/";

			# ani-cli
			ani = "ani-cli";
		};
	};

	home.packages = with pkgs; [
		eza
	];
}
