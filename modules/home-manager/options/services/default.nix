{ lib, ... }:

let
  contents = builtins.readDir ./.;
  dirs = lib.filterAttrs (name: type: type == "directory") contents;
  paths = lib.mapAttrsToList (name: type: ./. + "/${name}") dirs;
in
{
  imports = paths;
}
