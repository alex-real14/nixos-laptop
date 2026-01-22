{ ... }:

{
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
}
