{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  xdg.configFile."nvim/lua/options.lua".source = ./lua/options.lua;

  xdg.configFile."nvim/init.lua".text = ''
    require("options")
  '';
}

