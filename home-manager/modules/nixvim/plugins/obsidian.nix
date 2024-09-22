{
  programs.nixvim = {
    plugins = {
      obsidian.enable = true;
      obsidian.settings = {
        completion = {
          min_chars = 2;
          nvim_cmp = true;
        };
      };
    };
  };
}
