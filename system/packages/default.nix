{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    brightnessctl
    git
    impala
    tree
    wget
    wl-clipboard
  ];
}
