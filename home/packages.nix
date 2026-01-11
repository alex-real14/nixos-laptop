{ pkgs, ... }:

{
  programs.television.enable = true;
  programs.btop.enable = true;
  programs.quickshell.enable = true;

  home.packages = with pkgs; [
    clipse
    chromium
    ghostty
    hyprpolkitagent
    vim
    yazi
  ];
}

