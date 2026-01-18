{ config, ... }:

let
  dotfilesPath = "${config.home.homeDirectory}/nixos/home/dotfiles";

  createSymlink = path: config.lib.file.mkOutOfStoreSymlink path;

  configFiles = {
    "hypr" = "hypr";
    "ghostty" = "ghostty";
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
    source = createSymlink "${dotfilesPath}/${subpath}";
    # recursive = true;
  }) configFiles;

  xdg.enable = true;
}
