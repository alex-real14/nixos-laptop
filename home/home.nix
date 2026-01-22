{
  config,
  lib,
  inputs,
  ...
}:

let
  env = import ./env.nix;
in
{
  home.username = "alex";
  home.homeDirectory = "/home/alex";
  home.stateVersion = "25.11"; # DO NOT TOUCH
  home.sessionVariables = env;
  systemd.user.sessionVariables = env;

  imports = [
    ./packages
    ./programs
    ./services
  ];

  home.file.".config/hypr/env.conf".text = lib.concatStringsSep "\n" (
    lib.mapAttrsToList (k: v: "env = ${k},${v}") env
  );
}
