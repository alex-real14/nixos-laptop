{ config, pkgs, ... }:

{
  services.hyprlauncher = {
    enable = true;
    settings = {
      "General" = {
        # This points hyprlauncher to your theme file
        theme = "${config.home.homeDirectory}/.config/hypr/theme.hl";
        grab_focus = true;
      };

      "UI" = {
        window_size = "600 400";
      };

      "Finders" = {
        default_finder = "desktop";
        math_prefix = "=";
        unicode_prefix = ".";
        desktop_icons = true;
      };

      "Cache" = {
        enabled = true;
      };
    };
  };

  services.ssh-agent.enable = true;

  programs.television.enable = true;
  programs.btop.enable = true;
  programs.quickshell.enable = true;
  xdg.enable = true;

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/alex/nixos";
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      dotfiles = "cd ~/nixos/home/dotfiles";
      home = "cd ~/nixos/home";
      nixos = "cd ~/nixos";
      hconf = "vim ~/nixos/home/dotfiles/hypr/hyprland.conf";
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

  programs.chromium = {
    enable = true;
  };

  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
  };

  programs.ghostty = {
    enable = true;
    settings = {
      theme = "TokyoNight Storm";
      font-size = 11;
    };
  };

  home.packages = with pkgs; [
    bluetui
    clipse
    hyprpolkitagent
  ];
}
