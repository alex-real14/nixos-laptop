{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.networkmanager.enable = true;

  hardware.bluetooth.enable = true;

  programs.hyprland.enable = true;

  programs.chromium = {
    enable = true;
    extensions = [
      "pgbjifpikialeahbdendkjioeafbmfkn" # Tokyo Night Storm Theme
      "ddkjiahejlhfcafbddmgiahcphecmpfh" # uBlock Origin Lite
    ];
  };

  services.upower.enable = true;
  services.tuned.enable = true;
  services.getty.autologinUser = "alex";

  environment.systemPackages = with pkgs; [
    brightnessctl
    chromium
    git
    wget
  ];

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos-laptop";
  time.timeZone = "America/New_York";

  users.users.alex = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  system.stateVersion = "25.11"; # DO NOT CHANGE
}
