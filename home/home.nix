{
  config,
  lib,
  inputs,
  ...
}:

let
  envVars = import ./env-vars.nix;
in
{
  home.username = "alex";
  home.homeDirectory = "/home/alex";
  home.stateVersion = "25.11";
  home.sessionVariables = envVars;

  imports = [
    ./packages.nix
    ./nvf
  ];

  home.file.".config/hypr/hyprland.conf".source = ./dotfiles/hypr/hyprland.conf;
  home.file.".config/ghostty/config".source = ./dotfiles/ghostty/config;
}
