{ ... }:

{
  programs.starship = {
    enable = true;
    enableNushellIntegration = true;

    settings = {
      add_newline = true;
      format = "$directory$git_branch$git_status$nix_shell$character";

      palette = "tokyo_night";

      palettes.tokyo_night = {
        background = "#24283b";
        foreground = "#c0caf5";
        black = "#414868";
        red = "#f7768e";
        green = "#9ece6a";
        yellow = "#e0af68";
        blue = "#7aa2f7";
        magenta = "#bb9af7";
        cyan = "#7dcfff";
        white = "#a9b1d6";
        orange = "#ff9e64";
      };

      character = {
        success_symbol = "[❯](bold blue)";
        error_symbol = "[❯](bold red)";
        vicmd_symbol = "[❮](bold magenta)";
      };

      directory = {
        style = "bold cyan";
        truncation_length = 5;
        truncation_symbol = "…/";
        read_only = " ";
        read_only_style = "red";
      };

      nix_shell = {
        symbol = "❄ ";
        style = "bold blue";
        format = "[$symbol$state( \\($name\\))]($style) ";
      };

      git_branch = {
        symbol = " ";
        style = "magenta";
      };

      git_status = {
        style = "yellow";
        format = "([$all_status$ahead_behind]($style))";
        conflicted = "≠";
        ahead = "⇡";
        behind = "⇣";
        diverged = "⇕";
        untracked = "?";
        stashed = "$";
        modified = "!";
        staged = "+";
        renamed = "»";
        deleted = "✘";
      };
    };
  };
}
