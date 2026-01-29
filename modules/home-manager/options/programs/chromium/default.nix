{ ... }:

# Note: Extensions declared in nixos/system/programs/chromium/default.nix

{
  programs.chromium = {
    enable = true;
    commandLineArgs = [
      "--prefer-native-proxy"
    ];
  };
}
