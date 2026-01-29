{ pkgs, ... }:

{
  services.dbus.packages = [ pkgs.xdg-desktop-portal-termfilechooser ];
}
