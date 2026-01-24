{ ... }:

{
  networking = {
    networkmanager.enable = false;
    hostName = "laptop";
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
