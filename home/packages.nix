{ pkgs, inputs, ... }:

let
  envVars = import ./env.nix;
in
{
  imports = [
    inputs.walker.homeManagerModules.default
  ];

  programs.onedrive = {
    enable = true;
    settings = {
      sync_root_files = "true";
    };
  };

  home.file.".config/onedrive/sync_list".source = ./dotfiles/onedrive/sync_list;

  programs.walker = {
    enable = true;
    runAsService = true;
    config = {
      search.placeholder = " Search...";
      ui.fullscreen = true;
      theme = "tokyo-night-storm";
      force_keyboard_focus = true;
      selection_wrap = true;
      hide_action_hints = true;
      hide_quick_activation = true;
    };
    themes."tokyo-night-storm" = {
      style = ''
        @define-color background #24283b;
        @define-color base #1f2335;
        @define-color border #414868;
        @define-color text #c0caf5;
        @define-color selected-text #7aa2f7;

        * {
          all: unset;
        }

        * {
          font-family: monospace;
          font-size: 18px;
          color: @text;
        }

        scrollbar {
          opacity: 0;
        }

        .normal-icons {
          -gtk-icon-size: 16px;
        }

        .large-icons {
          -gtk-icon-size: 32px;
        }

        .box-wrapper {
          background: alpha(@base, 0.95);
          padding: 20px;
          border: 2px solid @border;
        }

        .preview-box {
        }

        .box {
        }

        .search-container {
          background: @base;
          padding: 10px;
          border: 1px solid @border;
        }

        .input placeholder {
          opacity: 0.5;
        }

        .input {
        }

        .input:focus,
        .input:active {
          box-shadow: none;
          outline: none;
        }

        .content-container {
        }

        .placeholder {
        }

        .scroll {
        }

        .list {
        }

        child,
        child > * {
        }

        child:hover .item-box {
        }

        child:selected .item-box {
        }

        child:selected .item-box * {
          color: @selected-text;
        }

        .item-box {
          padding-left: 14px;
        }

        .item-text-box {
          all: unset;
          padding: 14px 0;
        }

        .item-text {
        }

        .item-subtext {
          font-size: 0px;
          min-height: 0px;
          margin: 0px;
          padding: 0px;
        }

        .item-image {
          margin-right: 14px;
          -gtk-icon-transform: scale(0.9);
        }

        .current {
          font-style: italic;
        }

        .keybind-hints {
          background: @background;
          padding: 10px;
          margin-top: 10px;
        }

        .preview {
        }
      '';
      layouts = {
        "layout" = ''
          <?xml version="1.0" encoding="UTF-8"?>
          <interface>
            <requires lib="gtk" version="4.0"></requires>
            <object class="GtkWindow" id="Window">
              <style>
                <class name="window"></class>
              </style>
              <property name="resizable">true</property>
              <property name="title">Walker</property>
              <child>
                <object class="GtkBox" id="BoxWrapper">
                  <style>
                    <class name="box-wrapper"></class>
                  </style>
                  <property name="width-request">300</property>
                  <property name="overflow">hidden</property>
                  <property name="orientation">horizontal</property>
                  <property name="valign">center</property>
                  <property name="halign">center</property>
                  <child>
                    <object class="GtkBox" id="Box">
                      <style>
                        <class name="box"></class>
                      </style>
                      <property name="orientation">vertical</property>
                      <property name="hexpand-set">true</property>
                      <property name="hexpand">true</property>
                      <property name="spacing">10</property>
                      <child>
                        <object class="GtkBox" id="SearchContainer">
                          <style>
                            <class name="search-container"></class>
                          </style>
                          <property name="overflow">hidden</property>
                          <property name="orientation">horizontal</property>
                          <property name="halign">fill</property>
                          <property name="hexpand-set">true</property>
                          <property name="hexpand">true</property>
                          <child>
                            <object class="GtkEntry" id="Input">
                              <style>
                                <class name="input"></class>
                              </style>
                              <property name="halign">fill</property>
                              <property name="hexpand-set">true</property>
                              <property name="hexpand">true</property>
                            </object>
                          </child>
                        </object>
                      </child>
                      <child>
                        <object class="GtkBox" id="ContentContainer">
                          <style>
                            <class name="content-container"></class>
                          </style>
                          <property name="orientation">horizontal</property>
                          <property name="spacing">10</property>
                          <property name="vexpand">true</property>
                          <property name="vexpand-set">true</property>
                          <child>
                            <object class="GtkLabel" id="ElephantHint">
                              <style>
                                <class name="elephant-hint"></class>
                              </style>
                              <property name="hexpand">true</property>
                              <property name="height-request">100</property>
                              <property name="label">Waiting for elephant...</property>
                            </object>
                          </child>
                          <child>
                            <object class="GtkLabel" id="Placeholder">
                              <style>
                                <class name="placeholder"></class>
                              </style>
                              <property name="label">No Results</property>
                              <property name="yalign">0.0</property>
                              <property name="hexpand">true</property>
                            </object>
                          </child>
                          <child>
                            <object class="GtkScrolledWindow" id="Scroll">
                              <style>
                                <class name="scroll"></class>
                              </style>
                              <property name="hexpand">true</property>
                              <property name="can_focus">false</property>
                              <property name="overlay-scrolling">true</property>
                              <property name="max-content-width">300</property>
                              <property name="max-content-height">200</property>
                              <property name="min-content-height">0</property>
                              <property name="propagate-natural-height">true</property>
                              <property name="propagate-natural-width">true</property>
                              <property name="hscrollbar-policy">automatic</property>
                              <property name="vscrollbar-policy">automatic</property>
                              <child>
                                <object class="GtkGridView" id="List">
                                  <style>
                                    <class name="list"></class>
                                  </style>
                                  <property name="max_columns">1</property>
                                  <property name="can_focus">false</property>
                                </object>
                              </child>
                            </object>
                          </child>
                          <child>
                            <object class="GtkBox" id="Preview">
                              <style>
                                <class name="preview"></class>
                              </style>
                            </object>
                          </child>
                        </object>
                      </child>
                      <child>
                        <object class="GtkBox" id="Keybinds">
                          <property name="hexpand">true</property>
                          <property name="margin-top">10</property>
                          <style>
                            <class name="keybinds"></class>
                          </style>
                          <child>
                            <object class="GtkBox" id="GlobalKeybinds">
                              <property name="spacing">10</property>
                              <style>
                                <class name="global-keybinds"></class>
                              </style>
                            </object>
                          </child>
                          <child>
                            <object class="GtkBox" id="ItemKeybinds">
                              <property name="hexpand">true</property>
                              <property name="halign">end</property>
                              <property name="spacing">10</property>
                              <style>
                                <class name="item-keybinds"></class>
                              </style>
                            </object>
                          </child>
                        </object>
                      </child>
                      <child>
                        <object class="GtkLabel" id="Error">
                          <style>
                            <class name="error"></class>
                          </style>
                          <property name="xalign">0</property>
                          <property name="visible">false</property>
                        </object>
                      </child>
                    </object>
                  </child>
                </object>
              </child>
            </object>
          </interface>
        '';
      };
    };
  };

  services.ssh-agent.enable = true;

  programs.television = {
    enable = true;

    channels = {
      files = {
        metadata = {
          name = "files";
          description = "A channel to select files and directories";
          requirements = [
            "fd"
            "bat"
          ];
        };
        source = {
          command = [
            "fd -t f"
            "fd -t f -H"
          ];
        };
        preview = {
          command = "bat -n --color=always '{}'";
          env = {
            BAT_THEME = "ansi";
          };
        };
        keybindings = {
          shortcut = "f1";
          f12 = "actions:edit";
          ctrl-up = "actions:goto_parent_dir";
        };
        actions.edit = {
          description = "Opens the selected entries with the default editor (falls back to vim)";
          command = "${"EDITOR:-vim"} '{}'";
          mode = "execute";
        };
        actions.goto_parent_dir = {
          description = "Re-opens tv in the parent directory";
          command = "tv files ..";
          mode = "execute";
        };
      };

      text = {
        metadata = {
          name = "text";
          description = "A channel to find and select text from files";
          requirements = [
            "rg"
            "bat"
          ];
        };
        source = {
          command = "rg . --no-heading --line-number --colors 'match:fg:white' --colors 'path:fg:blue' --color=always";
          ansi = true;
          output = "{strip_ansi|split:\\::..2}";
        };
        preview = {
          command = "bat -n --color=always '{strip_ansi|split:\\::0}'";
          env = {
            BAT_THEME = "ansi";
          };
          offset = "{strip_ansi|split:\\::1}";
        };
        ui = {
          preview_panel = {
            header = "{strip_ansi|split:\\::..2}";
          };
        };
      };
    };
  };

  programs.fd.enable = true;
  programs.bat.enable = true;
  programs.ripgrep.enable = true;

  programs.btop.enable = true;
  programs.quickshell.enable = true;

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
  };

  programs.nushell = {
    enable = true;
    environmentVariables = envVars;
    settings = {
      show_banner = false;
    };
    extraConfig = ''
      mkdir ($nu.data-dir | path join "vendor/autoload")
      tv init nu | save -f ($nu.data-dir | path join "vendor/autoload/tv.nu")
    '';
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
        truncation_length = 5;
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

  programs.fastfetch = {
    enable = true;
    settings = {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/master/doc/json_schema.json";
      logo = {
        type = "auto";
        source = "";
        padding = {
          top = 0;
          left = 0;
          right = 4;
        };
        printRemaining = true;
        preserveAspectRatio = false;
        recache = false;
        position = "left";
        chafa = {
          fgOnly = false;
          symbols = "block+border+space-wide-inverted";
        };
      };
      display = {
        stat = false;
        pipe = false;
        showErrors = false;
        disableLinewrap = true;
        hideCursor = false;
        separator = ": ";
        brightColor = true;
        size = {
          maxPrefix = "YB";
          binaryPrefix = "iec";
          ndigits = 2;
        };
        temp = {
          unit = "D";
          ndigits = 1;
          color = {
            green = "32";
            yellow = "93";
            red = "91";
          };
        };
        percent = {
          type = [
            "num"
            "num-color"
          ];
          ndigits = 0;
        };
        bar = {
          char = {
            elapsed = "■";
            total = "-";
          };
          border = {
            left = "[ ";
            right = " ]";
          };
          color = {
            elapsed = "auto";
            total = "97";
            border = "97";
          };
          width = 10;
        };
      };
      general = {
        thread = true;
        processingTimeout = 5000;
        detectVersion = true;
      };
      modules = [
        {
          type = "title";
          key = " ";
          keyIcon = "";
        }
        {
          type = "separator";
          string = "-";
        }
        {
          type = "os";
          keyIcon = "";
        }
        {
          type = "host";
          keyIcon = "󰌢";
        }
        {
          type = "kernel";
          keyIcon = "";
        }
        {
          type = "uptime";
          keyIcon = "";
        }
        {
          type = "packages";
          keyIcon = "󰏖";
          disabled = [ "winget" ];
        }
        {
          type = "shell";
          keyIcon = "";
        }
        {
          type = "display";
          keyIcon = "󰍹";
        }
        {
          type = "de";
          keyIcon = "";
        }
        {
          type = "wm";
          keyIcon = "";
        }
        {
          type = "wmtheme";
          keyIcon = "󰓸";
        }
        {
          type = "theme";
          keyIcon = "󰉼";
        }
        {
          type = "icons";
          keyIcon = "";
        }
        {
          type = "font";
          keyIcon = "";
        }
        {
          type = "cursor";
          keyIcon = "󰆿";
        }
        {
          type = "terminal";
          keyIcon = "";
        }
        {
          type = "terminalfont";
          keyIcon = "";
        }
        {
          type = "cpu";
          keyIcon = "";
        }
        {
          type = "gpu";
          keyIcon = "󰾲";
          detectionMethod = "pci";
        }
        {
          type = "memory";
          keyIcon = "";
        }
        {
          type = "swap";
          keyIcon = "󰓡";
        }
        {
          type = "disk";
          keyIcon = "";
          hideFolders = "/efi:/boot:/boot/*";
        }
        {
          type = "localip";
          keyIcon = "󰩟";
          compact = false;
        }
        {
          type = "battery";
          keyIcon = "";
        }
        {
          type = "poweradapter";
          keyIcon = "󰚥";
        }
        {
          type = "locale";
          keyIcon = "";
        }
        "break"
      ];
    };
  };

  home.packages = with pkgs; [
    bluetui
    clipse
    ghostty
    hyprpolkitagent
  ];
}
