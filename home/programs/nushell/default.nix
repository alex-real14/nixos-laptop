{ ... }:

{
  programs.nushell = {
    enable = true;
    environmentVariables = import ../../env.nix;
    settings = {
      show_banner = false;
    };
    extraConfig = ''
      mkdir ($nu.data-dir | path join "vendor/autoload")
      tv init nu | save -f ($nu.data-dir | path join "vendor/autoload/tv.nu")
    '';
    shellAliases = {
      dotfiles = "cd ~/nixos/home/dotfiles";
      home = "cd ~/nixos/home";
      nixos = "cd ~/nixos";
      hconf = "vim ~/nixos/home/dotfiles/hypr/hyprland.conf";
    };
  };
}
