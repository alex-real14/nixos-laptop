{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    elephant = {
      url = "github:abenz1267/elephant";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    walker = {
      url = "github:abenz1267/walker";
      inputs.elephant.follows = "elephant";
    };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      mkSystem =
        host: hostType:
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs hostType;
          };
          modules = [
            ./hosts/${host}/configuration.nix
          ];
        };
    in
    {
      nixosConfigurations = {
        laptop = mkSystem "laptop" "laptop";
        desktop = mkSystem "desktop" "desktop";
      };
    };
}
