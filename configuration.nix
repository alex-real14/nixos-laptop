{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./system
  ];

  system.stateVersion = "25.11"; # DO NOT TOUCH
}
