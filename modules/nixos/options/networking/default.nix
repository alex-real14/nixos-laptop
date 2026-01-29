{ hostType, ... }:

{
  networking = {
    hostName = hostType;

    networkmanager.enable = false;

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
  environment.etc."iwd/TheAvli_WiFi.network".source = ./TheAvli_WiFi.network;
}
