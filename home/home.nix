{
  config,
  ...
}:

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

  xdg.configFile."hypr" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/alex/nixos/home/dotfiles/hypr";
    recursive = true;
  };

}
