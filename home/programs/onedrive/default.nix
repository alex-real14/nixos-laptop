{ ... }:

{
  programs.onedrive = {
    enable = true;
    settings = {
      sync_root_files = "true";
    };
  };

  home.file.".config/onedrive/sync_list".source = ../../dotfiles/onedrive/sync_list;
}
