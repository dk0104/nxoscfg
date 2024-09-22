{
  programs.nixvim = {
    # keymaps = [
      #   {
        #     mode = "n";
        #     key = "<leader>ot";
        #     action = ":ToggleTerm size=42 direction=horizontal name=scratch<CR>";
        #     options.silent = true;
        #   }];

        plugins.toggleterm = {
          enable = true;
          settings = {
            direction = "float";
            float_opts = {
              border = "curved";
              height = 30;
              width = 130;
            };
            open_mapping = "[[<leader>ot]]";
          };
        };
  };
}
