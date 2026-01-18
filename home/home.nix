{ config, ... }:

let
  dotfiles = "${config.home.homeDirectory}/dotfiles";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    hypr = "hypr";
    ghostty = "ghostty";
  };
in
{
  home.username = "alex";
  home.homeDirectory = "/home/alex";
  home.stateVersion = "25.11";
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  imports = [
    ./packages.nix
    ./nvf
  ];

  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfiles}/${subpath}";
    recursive = true;
  }) configs;

}
