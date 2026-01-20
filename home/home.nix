{ config, lib, ... }:

{
  home.username = "alex";
  home.homeDirectory = "/home/alex";
  home.stateVersion = "25.11";
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    NH_FLAKE = "/home/alex/nixos";
  };

  imports = [
    ./packages.nix
    ./nvf
  ];

  home.file.".config/hypr/hyprland.conf".source = ./dotfiles/hypr/hyprland.conf;

  home.file.".config/ghostty/config".source = ./dotfiles/ghostty/config;

}
