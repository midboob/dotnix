{ pkgs, config, ... }: {
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "./ascii1.txt";
        type = "auto";
        height = 18;
        padding = {
          top = 1;
          bottom = 0;
          right = 2;
          left = 1;
        };
      };
      display = {
        separator = " •  ";
      };
      modules = [
        "break"
        "break"
        {
          type = "title";
          color = {
            user = "32";
            at = "90";
            host = "32";
          };
          key = " ";
          keyColor = "32";
        }
        {
          type = "os";
          key = " ";
          keyColor = "35";
        }
        {
          type = "kernel";
          key = " ";
          keyColor = "91";
        }
        {
          type = "uptime";
          key = "󰅐 ";
          keyColor = "36";
        }
        "break"
        {
          type = "cpu";
          format = "{1} ({2}) @ {4}";
          key = "󰻠 ";
          keyColor = "31";
        }
        {
          type = "gpu";
          key = "󰢮 ";
          keyColor = "34";
        }
        {
          type = "memory";
          format = "{} / {}";
          key = " ";
          keyColor = "32";
        }
        {
          type = "disk";
          key = "󰋊 ";
          keyColor = "33";
        }
        {
          type = "wm";
          format = "{} ({3})";
          key = " ";
          keyColor = "33";
        }
        "break"
        {
          type = "colors";
          symbol = "circle";
        }
        "break"
        "break"
      ];
    };
  };
}
