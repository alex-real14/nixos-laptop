{ config, pkgs, ... }:

{
	home.username = "alex";
	home.homeDirectory = "/home/alex";
	home.stateVersion = "25.11";
	
	imports = [
		./packages.nix
	];

	programs.bash = {
		enable = true;
		shellAliases = {
			dotfiles = "cd ~/nixos/home/dotfiles";
			home = "cd ~/nixos/home";
			nixos = "cd ~/nixos";
			hconf = "vim ~/nixos/home/dotfiles/hypr/hyprland.conf";
		};
	};

	home.file.".config/hypr/hyprland.conf".source = ./dotfiles/hypr/hyprland.conf;
	home.file.".config/ghostty/config.ghostty".source = ./dotfiles/ghostty/config.ghostty;
}	
