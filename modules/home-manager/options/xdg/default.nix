{ pkgs, lib, ... }:

{
  # Ensure the package is available to the user
  home.packages = [ pkgs.xdg-desktop-portal-termfilechooser ];

  xdg = {
    enable = true;
    portal = {
      enable = lib.mkForce true;
      # We use mkForce to ensure our preference isn't overridden by Hyprland defaults
      extraPortals = lib.mkForce [
        pkgs.xdg-desktop-portal-hyprland
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-termfilechooser
      ];

      config = {
        common = {
          default = [
            "hyprland"
            "gtk"
          ];
          "org.freedesktop.impl.portal.FileChooser" = [ "termfilechooser" ];
        };
      };
    };

    # This replaces the 'cp' and 'mkdir' steps from the bash script
    configFile."xdg-desktop-portal-termfilechooser/config".text = ''
      [filechooser]
      cmd=yazi-wrapper.sh
      default_dir=$HOME
      env=TERMCMD='${lib.getExe pkgs.ghostty} -e'
    '';

    # The actual wrapper script
    configFile."xdg-desktop-portal-termfilechooser/yazi-wrapper.sh" = {
      executable = true;
      text = ''
        #!/bin/sh
        # Logic: If a directory ($2) is provided, open Yazi there. 
        # Always output selection to the path provided by the portal ($1).
        if [ -n "$2" ]; then
          ${lib.getExe pkgs.yazi} --chooser-file="$1" "$2"
        else
          ${lib.getExe pkgs.yazi} --chooser-file="$1"
        fi
      '';
    };
  };
}
