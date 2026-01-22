{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bluetui
    clipse
    ghostty
    hyprpolkitagent
  ];
}
