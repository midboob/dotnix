{ config, pkgs, lib, ... }:

{
  home.file."startpage" = {
    source = ./startpage;      # relative to this module file
    recursive = true;           # replicate the directory structure with symlinks
  };
}
