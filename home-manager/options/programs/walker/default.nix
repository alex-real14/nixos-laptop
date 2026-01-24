{ inputs, ... }:

{
  imports = [
    inputs.walker.homeManagerModules.default
  ];

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

      search.preferred = [
        "desktop_applications"
        "impala"
        "clipboard"
      ];

      plugins = [
        {
          name = "impala";
          prefix = "wifi";
          switcher_only = false;
        }
        {
          name = "clipboard";
          prefix = "c";
          switcher_only = false;
        }
      ];
    };

    themes."tokyo-night-storm" = {
      style = builtins.readFile ./walker.css;
      layouts = {
        "layout" = builtins.readFile ./walker.ui;
      };
    };
  };
}
