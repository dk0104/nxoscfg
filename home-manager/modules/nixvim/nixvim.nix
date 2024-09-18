{ inputs,  ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins/bundle.nix
    ./options.nix
    ./keymappings.nix
    #./autocomand.nix
  ];

  home.shellAliases.v = "nvim";
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    colorschemes = {
      catppuccin = {
        enable = true;
        settings = {
        background = {
          light = "macchiato";
          dark = "mocha";
        };

        flavour = "mocha";
        transparent_background = true;
        term_colors = true;
        integrations = {
          cmp = true;
          neotree = true;
          harpoon = true;
          illuminate = {
            enabled = true;
          };
          treesitter = true;
          treesitter_context = true;
          telescope.enabled = true;
          indent_blankline.enabled = true;
          mini.enabled = true;
          native_lsp = {
            enabled = true;
            inlay_hints = {
              background = true;
            };
            underlines = {
              errors = ["underline"];
              hints = ["underline"];
              information = ["underline"];
              warnings = ["underline"];
            };
          };
        };
        };
      };
    };
    performance = {
      combinePlugins = {
        enable = true;
        standalonePlugins = [
        ];
      };
      byteCompileLua.enable = true;
    };
    viAlias = true;
    vimAlias = true;
    luaLoader.enable = true;
  };


}
