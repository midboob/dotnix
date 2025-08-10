{ config, pkgs, lib, ... }:

{
  home.file."startpage" = {
    source = ./.config;      # relative to this module file
    recursive = true;           # replicate the directory structure with symlinks
  };
}
