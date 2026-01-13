{ pkgs, ... }:

{
  programs.television.enable = true;
  programs.btop.enable = true;
  programs.quickshell.enable = true;

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/alex/nixos";
  };

  programs.git = {
    enable = true;
    settings = {
      user.name = "Alex Real";
      user.email = "alexander.real14@gmail.com";
    };
  };

  home.packages = with pkgs; [
    clipse
    chromium
    ghostty
    hyprpolkitagent
    vim
    yazi
  ];
}

