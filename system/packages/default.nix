{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    brightnessctl
    ffmpeg
    git
    impala
    tree
    wget
    wl-clipboard
  ];
}
