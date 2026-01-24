{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./nixpkgs
  ];

  system.stateVersion = "25.11"; # DO NOT TOUCH
}
