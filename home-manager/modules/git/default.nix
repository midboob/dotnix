{
	programs.git = {
		enable = true;
		userName = "midboob";
		userEmail = "edwarddan72@gmail.com";
		extraConfig = {

    core = {
      compression = 9;          # zlib level 0–9
      whitespace  = "error";    # treat whitespace problems as errors
      editor = "nvim";
    };

			init.defaultBranch = "main";
    
      status = {
        branch             = true;
        short              = true;
        showStash          = true;
        showUntrackedFiles = "all"; # show individual files in untracked dirs
      };

      diff = {
        context = 3;          # fewer context lines in diffs
        renames = "copies";   # detect copies as renames in diffs
      };

      log = {
        abbrevCommit = true;  # short commit hashes in log
        graphColors  = "blue,yellow,cyan,magenta,green,red";

        commit.template = "${./template}";
      };
		};
	};
}
