{ hostType, inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs hostType; };
    users.alex = {
      home = {
        username = "alex";
        homeDirectory = "/home/alex";
        stateVersion = "25.11"; # DO NOT TOUCH
        sessionVariables = import ./env.nix;
      };
      imports = [ ./options ];
    };
    backupFileExtension = "backup";
  };
}
