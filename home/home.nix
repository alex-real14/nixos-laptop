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

	xdg.configFile."hypr" = {
		source = config.lib.file.mkOutOfStoreSymlink
		"${config.home.homeDirectory}/.config/hypr";
		recursive = true;
	};

	xdg.configFile."ghostty" = {
		source = config.lib.file.mkOutOfStoreSymlink
		"${config.home.homeDirectory}/.config/ghostty";
		recursive = true;
	};

}	
