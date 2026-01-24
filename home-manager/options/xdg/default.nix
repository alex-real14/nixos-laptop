{ pkgs, lib, ... }:

{
  xdg = {
    enable = true;
    portal = {
      enable = lib.mkForce true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      config.common.default = "*";
    };
  };
}
