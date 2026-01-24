{ ... }:

{
  programs.nushell = {
    enable = true;
    environmentVariables = import ../../../env.nix;
    settings = {
      show_banner = false;
    };
    extraConfig = ''
      mkdir ($nu.data-dir | path join "vendor/autoload")
      tv init nu | save -f ($nu.data-dir | path join "vendor/autoload/tv.nu")
    '';
    shellAliases = {
      home = "cd ~/nixos/home-manager";
      nixos = "cd ~/nixos";
      hconf = "vim ~/nixos/home-manager/options/wayland/windowManager/hyprland/default.nix";
    };
  };
}
