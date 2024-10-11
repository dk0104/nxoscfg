{
  programs.nixvim = {
    plugins = {
      obsidian.enable = true;
      obsidian.settings = {
        completion = {
          min_chars = 2;
          nvim_cmp = true;
        };
        new_notes_location = "current_dir";
        workspaces = [
        {
          name = "work_notes";
          path = "~/Docs/Vaults/work_s";
        }
      ];
      };
    };
  };
}
