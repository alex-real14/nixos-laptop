{ pkgs, ... }:

{
  programs.television.enable = true;
  programs.btop.enable = true;
  programs.quickshell.enable = true;

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "${builtins.getEnv "HOME"}/nixos";
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

  services.ssh-agent.enable = true;

  home.packages = with pkgs; [
    clipse
    chromium
    ghostty
    hyprpolkitagent
    vim
    yazi
  ];
}

