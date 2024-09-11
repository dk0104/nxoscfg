{ inputs,  ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./options.nix
    ./keymappings.nix
  ];

  home.shellAliases.v = "nvim";
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    colorschemes.catppuccin.enable = true;
    byteCompileLua.enable = true;
    viAlias = true;
    vimAlias = true;
    luaLoader.enable = true;
  };


}
