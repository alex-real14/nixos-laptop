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
			dotfiles = "cd /etc/nixos/home/dotfiles/";
			home = "cd /etc/nixos/home/";
			hyprlandConf = "sudo vim /etc/nixos/home/dotfiles/hypr/hyprland.conf";
		};
		# profileExtra = "exec start-hyprland";
	};

	home.file.".config/hypr/hyprland.conf".source = ./dotfiles/hypr/hyprland.conf;
	home.file.".config/ghostty/config.ghostty".source = ./dotfiles/ghostty/config.ghostty;
}	
