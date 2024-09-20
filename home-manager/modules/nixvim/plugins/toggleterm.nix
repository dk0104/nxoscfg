{
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "<leader>ot";
        action = ":ToggleTerm size=42 direction=horizontal name=scratch";
        options.silent = true;
      }];

    plugins.toggleterm = {
      enable = true;
    };
  };
}
