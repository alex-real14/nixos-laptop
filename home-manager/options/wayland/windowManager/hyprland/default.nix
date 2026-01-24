{ ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;

    systemd = {
      enable = true;
      variables = [ "--all" ];
    };

    settings = {
      monitor = ",preferred,auto,auto";

      "$terminal" = "ghostty";
      "$fileManager" = "yazi";
      "$browser" = "chromium";
      "$clipboardManager" = "clipse";
      "$mainMod" = "SUPER";

      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
        "EDITOR,${(import ../../../../env.nix).EDITOR}"
        "VISUAL,${(import ../../../../env.nix).VISUAL}"
        "NH_FLAKE,${(import ../../../../env.nix).NH_FLAKE}"
        "GDK_SCALE,${(import ../../../../env.nix).GDK_SCALE}"
        "XDG_SESSION_TYPE,${(import ../../../../env.nix).XDG_SESSION_TYPE}"
        "GTK_THEME,${(import ../../../../env.nix).GTK_THEME}"
        "XDG_CURRENT_DESKTOP,${(import ../../../../env.nix).XDG_CURRENT_DESKTOP}"
        "XDG_SESSION_DESKTOP,${(import ../../../../env.nix).XDG_SESSION_DESKTOP}"
        "GDK_BACKEND,${(import ../../../../env.nix).GDK_BACKEND}"
      ];

      exec-once = [
        "$terminal -e nu -i -e fastfetch"
      ];

      xwayland = {
        force_zero_scaling = true;
      };

      general = {
        gaps_in = 0;
        gaps_out = 0;
        border_size = 0;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };

      decoration = {
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = false;
        bezier = [
          "easeOutQuint, 0.23, 1, 0.32, 1"
          "easeInOutCubic, 0.65, 0.05, 0.36, 1"
          "linear, 0, 0, 1, 1"
          "almostLinear, 0.5, 0.5, 0.75, 1"
          "quick, 0.15, 0, 0.1, 1"
        ];
        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
          "zoomFactor, 1, 7, quick"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = true;
        background_color = "0xff24283b";
      };

      input = {
        kb_layout = "us";
        repeat_delay = 200;
        follow_mouse = 1;
        sensitivity = 0;
        touchpad.natural_scroll = true;
      };

      gesture = "3, horizontal, workspace";

      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };

      bind = [
        "$mainMod, B, exec, sh -c \"hyprctl clients | grep -q 'class: chromium-browser' && hyprctl dispatch focuswindow 'class:chromium-browser' || $browser\""
        "$mainMod SHIFT, B, exec, btop"
        "$mainMod, E, exec, $terminal -e $fileManager"
        "$mainMod, G, exec, sh -c \"hyprctl clients | grep -q 'class: chrome-gemini.google.com__-Default' && hyprctl dispatch focuswindow 'class:chrome-gemini.google.com__-Default' || $browser --app=https://gemini.google.com\""
        "$mainMod, H, movefocus, l"
        "$mainMod, J, movefocus, d"
        "$mainMod, K, movefocus, u"
        "$mainMod, L, movefocus, r"
        "$mainMod, M, exec, command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"
        "$mainMod, N, togglesplit,"
        "$mainMod, O, exec, $browser --app=https://outlook.office.com"
        "$mainMod, P, pseudo,"
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"
        "$mainMod, T, exec, $browser --app=https://teams.microsoft.com"
        "$mainMod, V, exec, $terminal -e $clipboardManager"
        "$mainMod, W, killactive,"
        "$mainMod, Y, exec, $browser --app=https://youtube.com"
        "$mainMod, RETURN, exec, $terminal"
        "$mainMod, SPACE, exec, nc -U /run/user/1000/walker/walker.sock"
      ]
      ++ (builtins.concatLists (
        builtins.genList (
          i:
          let
            ws = i + 1;
          in
          [
            "$mainMod, code:1${toString i}, workspace, ${toString ws}"
            "$mainMod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
          ]
        ) 10
      ));

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];

      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      windowrule = [
        "suppress_event maximize, match:class .*"
        "no_focus on, match:class ^$, match:title ^$"
        "float on, match:class hyprland-run"
        "move 20 (monitor_h-120), match:class hyprland-run"
        "workspace 2, match:initial_class ^chromium-browser$"
        "workspace 3, match:initial_class ^chrome-gemini\.google\.com__-Default$"
      ];
    };
  };
}
