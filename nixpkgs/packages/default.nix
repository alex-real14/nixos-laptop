{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    brightnessctl
    git
    wget
  ];
}
