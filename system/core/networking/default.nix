{ ... }:

{
  networking = {
    networkmanager.enable = false;
    hostName = "nixos-laptop";
    wireless.iwd = {
      enable = true;
      settings = {
        Settings = {
          AutoConnect = true;
        };
        General = {
          EnableNetworkConfiguration = true;
        };
      };
    };
  };
  environment.etc."iwd/TheAvli_WiFi.network".source = ../../../home/dotfiles/iwd/TheAvli_WiFi.network;
}
