{ ... }:

{
  programs.ghostty = {
    enable = true;

    settings = {
      theme = "TokyoNight Storm";
      font-size = 11;
      shell-integration = "none";
      command = "direct:nu";
    };

    installBatSyntax = true;
    installVimSyntax = true;
  };
}
