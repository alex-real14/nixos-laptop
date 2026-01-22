{ lib, ... }:

let
  contents = builtins.readDir ./.;
  dirs = lib.filterAttrs (name: type: type == "directory") contents;
  paths = lib.mapAttrsToList (name: _: ./. + "/${name}") dirs;
in
{
  imports = paths;
}
