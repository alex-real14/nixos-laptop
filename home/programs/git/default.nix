{ pkgs, ... }:

{
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
}
