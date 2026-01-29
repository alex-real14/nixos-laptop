{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bluetui
    ffmpeg
    impala
    tree
    wl-clipboard
  ];
}
