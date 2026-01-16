{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      tokyonight-nvim
      nvim-treesitter.withAllGrammars
    ];

    extraLuaConfig = ''
      require("options")
      require("treesitter")

      vim.o.termguicolors = true
      vim.cmd("colorscheme tokyonight-storm")
    '';
  };

  xdg.configFile."nvim/lua".source = ./lua;
}
