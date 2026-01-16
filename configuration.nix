{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  programs.hyprland.enable = true;

  services.upower.enable = true;
  services.tuned.enable = true;
  # services.getty.autologinUser = "alex";
  # programs.regreet.enable = true;
  services.greetd = {
    enable = true;

    settings = {
      default_session = {
        command = "start-hyprland";
        user = "alex";
      };

      greeters = [
        {
          enable = true;
          package = pkgs.tuigreet;
          # Optional extra args for tuigreet:
          extraArgs = [
            "--remember" # remembers last user
            "--greeting"
            "Welcome, Alex!"
            "--time"
          ];
        }
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    brightnessctl
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
    hashedPassword = "$6$lKdEFcfszNGlSUyI$U.Q65H0q4xj7wSZ59zAOrlIvf8I1RkoqnS8KDEQOD9PZiDWv3mk0W2abXCsLhIRvlehHOetIGcEKPruhT7Agm/";
  };

  system.stateVersion = "25.11"; # DO NOT CHANGE
}
