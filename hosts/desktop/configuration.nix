{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
    ../../modules/home-manager
  ];

  system.stateVersion = "25.11"; # DO NOT TOUCH
}
