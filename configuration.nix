{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  networking.networkmanager.enable = true;
  hardware.bluetooth.enable =true;
  programs.hyprland.enable = true;
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/alex/nixos";
  };

  services.upower.enable = true;
  services.tuned.enable = true;
  # services.getty.autologinUser = "alex";

  environment.systemPackages = with pkgs; [
    brightnessctl
    git
    wget
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

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


