{
	description= "My NIXOS implementation";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		noctalia = {
		 	url = "github:noctalia-dev/noctalia-shell";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = inputs@{self, nixpkgs, home-manager, ... }: {
		nixosConfigurations.nixos-laptop = nixpkgs.lib.nixosSystem {
			specialArgs = { inherit inputs; };
			modules = [
				./configuration.nix
				home-manager.nixosModules.home-manager {
					home-manager = {
						useGlobalPkgs = true;
						useUserPackages = true;
						users.alex = import ./home/home.nix;
						backupFileExtension = "backup";
					};
				}
				./noctalia.nix
			];
		};
	};
}
