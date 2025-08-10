{ config, lib, pkgs, ... }:

{
  home.file."startpage".source = builtins.cleanSource ./.;
}
