{
  inputs,
  ...
}:

{
  imports = [ inputs.nvf.homeManagerModules.default ];

  programs.nvf = {
    enable = true;
    settings = {
      vim.viAlias = true;
      vim.vimAlias = true;
      vim.globals.mapleader = " ";
      vim.theme = {
        enable = true;
        name = "tokyonight";
        style = "storm";
      };

      vim.lsp = {
        enable = true;
        formatOnSave = true;
      };

      vim.languages = {
        enableTreesitter = true;

        nix = {
          enable = true;
          format = {
            enable = true;
            type = [ "nixfmt" ];
          };
          lsp = {
            enable = true;
            servers = [ "nixd" ];
          };
        };

        markdown.enable = true;
        bash.enable = true;
      };

      vim.statusline.lualine.enable = true;
      vim.telescope.enable = true;
      vim.autocomplete.nvim-cmp.enable = true;
      vim.filetree.neo-tree.enable = true;

      vim.luaConfigRC.options = builtins.readFile ./lua/options.lua;

      vim.keymaps = [
        {
          key = "<leader>e";
          mode = "n";
          action = ":Neotree toggle<CR>";
          silent = true;
          desc = "Toggle Tree Explorer";
        }
        {
          key = "<leader>ff";
          mode = "n";
          action = ":Telescope find_files<CR>";
          silent = true;
          desc = "Find Files";
        }
      ];
    };
  };
}
