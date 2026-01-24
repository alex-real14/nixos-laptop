{ pkgs, ... }:

{
  gtk = {
    enable = true;
    theme = {
      name = "TokyoNight-Storm";
      package = pkgs.tokyonight-gtk-theme;
    };
    iconTheme = {
      name = "TokyoNight-Storm";
      package = pkgs.tokyonight-gtk-theme;
    };

    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };
}
