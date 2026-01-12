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
			hconf = "sudo vim ~/nixos/home/dotfiles/hypr/hyprland.conf";
			test = "echo testing alias";
		};
	};

	home.file.".config/hypr/hyprland.conf".source = ./dotfiles/hypr/hyprland.conf;
	home.file.".config/ghostty/config.ghostty".source = ./dotfiles/ghostty/config.ghostty;
}	
