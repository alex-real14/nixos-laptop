{ lib, ... }:

{
  imports =
    let
      files = builtins.readDir ./.;
      nixFiles = lib.filterAttrs (
        name: type:
        (type == "regular" || type == "symlink") && lib.hasSuffix ".nix" name && name != "default.nix"
      ) files;
    in
    lib.mapAttrsToList (name: _: ./. + "/${name}") nixFiles;
}
