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
  home.stateVersion = "25.11";
  home.sessionVariables = env;
  systemd.user.sessionVariables = env;

  imports = [
    ./packages.nix
    ./nvf
  ];

  home.file.".config/hypr/hyprland.conf".source = ./dotfiles/hypr/hyprland.conf;
  home.file.".config/ghostty/config".source = ./dotfiles/ghostty/config;
  home.file.".config/hypr/env.conf".text = lib.concatStringsSep "\n" (
    lib.mapAttrsToList (k: v: "env = ${k},${v}") env
  );
}
