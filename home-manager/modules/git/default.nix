{
  programs.git = {
    enable = true;
    userName = "midboob";
    userEmail = "edwarddan72@gmail.com";

    extraConfig = {
      core = {
        compression = 9;
        editor = "nvim";
        whitespace = "error"; # (unrelated to the template)
      };

      init.defaultBranch = "main";

      status = {
        branch = true;
        short = true;
        showStash = true;
        showUntrackedFiles = "all";
      };

      diff = {
        context = 3;
        renames = "copies";
      };

      log = {
        abbrevCommit = true;
        graphColors = "blue,yellow,cyan,magenta,green,red";
      };

      commit = {
        template = "${./template}";
      };
    };
  };
}
