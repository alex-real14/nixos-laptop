{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    brightnessctl
    git
    impala
    wget
  ];
}
