{ ... }:

let
  env = import ./env.nix;
in
{
  home.username = "alex";
  home.homeDirectory = "/home/alex";
  home.stateVersion = "25.11"; # DO NOT TOUCH
  home.sessionVariables = env;
  systemd.user.sessionVariables = env;

  imports = [
    ./options
  ];
}
