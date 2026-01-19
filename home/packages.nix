{ pkgs, ... }:

{
  programs.bat.enable = true;

  services.ssh-agent.enable = true;

  programs.television.enable = true;
  programs.btop.enable = true;
  programs.quickshell.enable = true;

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/alex/nixos";
  };

  programs.kitty.enable = true;

  programs.nushell = {
    enable = true;
    settings = {
      show_banner = false;
    };
    shellAliases = {
      dotfiles = "cd ~/nixos/home/dotfiles";
      home = "cd ~/nixos/home";
      nixos = "cd ~/nixos";
      hconf = "vim ~/nixos/home/dotfiles/hypr/hyprland.conf";
    };
  };

  programs.starship = {
    enable = true;
    enableNushellIntegration = true;

    settings = {
      # -------------------------
      # Layout
      # -------------------------
      add_newline = true;

      format = "$directory$git_branch$git_status$nix_shell$character";

      # -------------------------
      # Tokyo Night Storm Palette
      # -------------------------
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

      # -------------------------
      # Prompt Character
      # -------------------------
      character = {
        success_symbol = "[❯](bold blue)";
        error_symbol = "[❯](bold red)";
        vicmd_symbol = "[❮](bold magenta)";
      };

      # -------------------------
      # Directory (bottom line)
      # -------------------------
      directory = {
        style = "bold cyan";
        truncation_length = 3;
        truncation_symbol = "…/";
        read_only = " ";
        read_only_style = "red";
      };

      # -------------------------
      # Nix Shell (top line)
      # -------------------------
      nix_shell = {
        symbol = "❄ ";
        style = "bold blue";
        format = "[$symbol$state( \\($name\\))]($style) ";
      };

      # -------------------------
      # Git (top line)
      # -------------------------
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

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "*" = {
        addKeysToAgent = "yes";
        identityFile = "~/.ssh/id_ed25519";
      };
    };
    extraConfig = ''
      Host github.com
        HostName github.com
        User git
    '';
  };

  programs.git = {
    enable = true;
    settings = {
      user.name = "Alex Real";
      user.email = "alexander.real14@gmail.com";
      url."git@github.com:".insteadOf = "https://github.com/";
      core.sshCommand = "ssh";
      push.default = "simple";
    };
  };

  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
  };

  programs.fastfetch.enable = true;

  # programs.ghostty.enable = true;

  home.packages = with pkgs; [
    bluetui
    clipse
    ghostty
    hyprpolkitagent
  ];
}
