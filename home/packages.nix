{ pkgs, ... }:

{
  programs.television.enable = true;
  programs.btop.enable = true;
  programs.quickshell.enable = true;

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/alex/nixos";
  };

programs.ssh = {
  enable = true;
  enableDefaultConfig = false;
  matchBlocks = {
    "*" = {
      addKeysToAgent = "yes";
      identityFile = "~/.ssh/id_ed25519";
    };
  };
  extraConfig = ''
    Host github.com
      HostName github.com
      User git
  '';
};

programs.git = {
  enable = true;
  settings = {
    user.name = "Alex Real";
    user.email = "alexander.real14@gmail.com";
    url."git@github.com:".insteadOf = "https://github.com/";
    core.sshCommand = "ssh";
    push.default = "simple";
  };
};

home.sessionVariables = {
  GTK_THEME = "Adwaita:dark"; # GTK dark theme
};

programs.chromium = {
  enable = true;
};

services.ssh-agent.enable = true;

programs.vim = {
  enable = true;
  defaultEditor = true;
};

programs.yazi.enable = true;

programs.ghostty = {
  enable = true;
  settings = {
    theme = "TokyoNight Moon";
    font-family = "FreeMono";
    font-size = 12;
  };
};

  home.packages = with pkgs; [
    clipse
    hyprpolkitagent
  ];
}

