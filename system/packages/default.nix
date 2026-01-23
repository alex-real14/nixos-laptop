{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    brightnessctl
    chromium
    git
    impala
    wget
  ];
}
