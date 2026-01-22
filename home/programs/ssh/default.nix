{ ... }:

{
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
}
