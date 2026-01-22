{ pkgs, ... }:

{
  users.users.alex = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };
}
