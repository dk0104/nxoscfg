{
  programs.nixvim = {
    plugins.lazygit = {
      enable = true;
    };
    # extaConfigLua = ''
    #    require("telelscope").load_extension("lazygit")



    keymaps = [

      {
         mode = "n";
         key = "<leader>gg";
         action = "<cmd>LazyGit<CR>";
          options = {
            desc = "LazyGit (root dir)";
          };
      }
    ];
    };
}
