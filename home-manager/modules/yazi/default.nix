{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;

    enableZshIntegration = true;
    enableBashIntegration = true;
    enableFishIntegration = true;

    # yazi.toml
    settings = {
      mgr = {
        ratio = [ 1 4 3 ];
        sort_by = "alphabetical";
        sort_sensitive = false;
        sort_reverse = false;
        sort_dir_first = true;
        sort_translit = false;
        linemode = "none";
        show_hidden = true;
        show_symlink = true;
        scrolloff = 5;
        mouse_events = [ "click" "scroll" ];
        title_format = "Yazi: {cwd}";
      };
      preview = {
        wrap = "yes";
        tab_size = 2;
        max_width = 600;
        max_height = 900;
        cache_dir = "";
        image_delay = 30;
        image_filter = "triangle";
        image_quality = 75;
        sixel_fraction = 15;
        ueberzug_scale = 1;
        ueberzug_offset = [ 0 0 0 0 ];
      };
      opener = {
        edit = [
          { run = ''${EDITOR:-nvim} "$@"''; desc = "\$EDITOR"; block = true; for = "unix"; }
          { run = "code %*"; orphan = true; desc = "code"; for = "windows"; }
          { run = "code -w %*"; block = true; desc = "code (block)"; for = "windows"; }
        ];
        open = [
          { run = ''xdg-open "$1"''; desc = "Open"; for = "linux"; }
          { run = ''open "$@"''; desc = "Open"; for = "macos"; }
          { run = ''start "" "%1"''; orphan = true; desc = "Open"; for = "windows"; }
          { run = ''termux-open "$1"''; desc = "Open"; for = "android"; }
        ];
        reveal = [
          { run = ''xdg-open "$(dirname "$1")"''; desc = "Reveal"; for = "linux"; }
          { run = ''open -R "$1"''; desc = "Reveal"; for = "macos"; }
          { run = ''explorer /select,"%1"''; orphan = true; desc = "Reveal"; for = "windows"; }
          { run = ''termux-open "$(dirname "$1")"''; desc = "Reveal"; for = "android"; }
          { run = ''clear; exiftool "$1"; echo "Press enter to exit"; read _''; block = true; desc = "Show EXIF"; for = "unix"; }
        ];
        extract = [
          { run = ''ya pub extract --list "$@"''; desc = "Extract here"; for = "unix"; }
          { run = "ya pub extract --list %*"; desc = "Extract here"; for = "windows"; }
        ];
        play = [
          { run = ''mpv --force-window "$@"''; orphan = true; for = "unix"; }
          { run = "mpv --force-window %*"; orphan = true; for = "windows"; }
          { run = ''mediainfo "$1"; echo "Press enter to exit"; read _''; block = true; desc = "Show media info"; for = "unix"; }
        ];
      };
      open = {
        rules = [
          { name = "*/"; use = [ "edit" "open" "reveal" ]; }
          { mime = "text/*"; use = [ "edit" "reveal" ]; }
          { mime = "image/*"; use = [ "open" "reveal" ]; }
          { mime = "{audio,video}/*"; use = [ "play" "reveal" ]; }
          { mime = "application/{zip,rar,7z*,tar,gzip,xz,zstd,bzip*,lzma,compress,archive,cpio,arj,xar,ms-cab*}"; use = [ "extract" "reveal" ]; }
          { mime = "application/{json,ndjson}"; use = [ "edit" "reveal" ]; }
          { mime = "*/javascript"; use = [ "edit" "reveal" ]; }
          { mime = "inode/empty"; use = [ "edit" "reveal" ]; }
          { name = "*"; use = [ "open" "reveal" ]; }
        ];
      };
      tasks = {
        micro_workers = 10;
        macro_workers = 10;
        bizarre_retry = 3;
        image_alloc = 536870912;
        image_bound = [ 0 0 ];
        suppress_preload = false;
      };
      plugin = {
        fetchers = [ { id = "mime"; name = "*"; run = "mime"; prio = "high"; } ];
        spotters = [
          { name = "*/"; run = "folder"; }
          { mime = "text/*"; run = "code"; }
          { mime = "application/{mbox,javascript,wine-extension-ini}"; run = "code"; }
          { mime = "image/{avif,hei?,jxl}"; run = "magick"; }
          { mime = "image/svg+xml"; run = "svg"; }
          { mime = "image/*"; run = "image"; }
          { mime = "video/*"; run = "video"; }
          { name = "*"; run = "file"; }
        ];
        preloaders = [
          { mime = "image/{avif,hei?,jxl}"; run = "magick"; }
          { mime = "image/svg+xml"; run = "svg"; }
          { mime = "image/*"; run = "image"; }
          { mime = "video/*"; run = "video"; }
          { mime = "application/pdf"; run = "pdf"; }
          { mime = "font/*"; run = "font"; }
          { mime = "application/ms-opentype"; run = "font"; }
        ];
        previewers = [
          { name = "*/"; run = "folder"; }
          { mime = "text/*"; run = "code"; }
          { mime = "application/{mbox,javascript,wine-extension-ini}"; run = "code"; }
          { mime = "application/{json,ndjson}"; run = "json"; }
          { mime = "image/{avif,hei?,jxl}"; run = "magick"; }
          { mime = "image/svg+xml"; run = "svg"; }
          { mime = "image/*"; run = "image"; }
          { mime = "video/*"; run = "video"; }
          { mime = "application/pdf"; run = "pdf"; }
          { mime = "application/{zip,rar,7z*,tar,gzip,xz,zstd,bzip*,lzma,compress,archive,cpio,arj,xar,ms-cab*}"; run = "archive"; }
          { mime = "application/{debian*-package,redhat-package-manager,rpm,android.package-archive}"; run = "archive"; }
          { name = "*.{AppImage,appimage}"; run = "archive"; }
          { mime = "application/{iso9660-image,qemu-disk,ms-wim,apple-diskimage}"; run = "archive"; }
          { mime = "application/virtualbox-{vhd,vhdx}"; run = "archive"; }
          { name = "*.{img,fat,ext,ext2,ext3,ext4,squashfs,ntfs,hfs,hfsx}"; run = "archive"; }
          { mime = "font/*"; run = "font"; }
          { mime = "application/ms-opentype"; run = "font"; }
          { mime = "inode/empty"; run = "empty"; }
          { name = "*"; run = "file"; }
        ];
      };
      input = { cursor_blink = false; };
      confirm = {};
      pick = {};
      which = {
        sort_by = "none";
        sort_sensitive = false;
        sort_reverse = false;
        sort_translit = false;
      };
    };

    # keymap.toml
    keymap = builtins.fromTOML (builtins.readFile ./keymap.toml);

    # theme.toml – you don't have one, so skip unless desired.

    # package.toml plugins
    plugins = {
      "full-border" = {
        src = pkgs.fetchFromGitHub {
          owner = "yazi-rs";
          repo = "plugins";
          rev = "aeca767";
          sha256 = "3996fc74044bc44144b323686f887e1";
        };
      };
      "pref-by-location" = {
        src = pkgs.fetchFromGitHub {
          owner = "boydaihungst";
          repo = "pref-by-location";
          rev = "1a50a3c";
          sha256 = "b0a66f27b4b01bad4e5972cf0754dcc9";
        };
      };
      "bunny" = {
        src = pkgs.fetchFromGitHub {
          owner = "stelcodes";
          repo = "bunny";
          rev = "a0b4e18";
          sha256 = "7acba2bb504c67dd7f2da135b88aae1b";
        };
      };
      "restore" = {
        src = pkgs.fetchFromGitHub {
          owner = "boydaihungst";
          repo = "restore";
          rev = "b7c3376";
          sha256 = "d9dbd61d8b814e74a5420dba1e4788c4";
        };
      };
      "smart-paste" = {
        src = pkgs.fetchFromGitHub {
          owner = "yazi-rs";
          repo = "plugins";
          rev = "aeca767";
          sha256 = "6fe47945aff6571d76f3beb65099ad7a";
        };
      };
      "chmod" = {
        src = pkgs.fetchFromGitHub {
          owner = "yazi-rs";
          repo = "plugins";
          rev = "aeca767";
          sha256 = "d0ad0c1946b46a30c8489735fe8de41c";
        };
      };
    };

    # init.lua
    initLua = builtins.readFile ./init.lua;
  };
}
