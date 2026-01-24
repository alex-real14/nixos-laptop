{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bluetui
    brightnessctl
    ffmpeg
    git
    impala
    tree
    wget
    wl-clipboard
  ];
}
