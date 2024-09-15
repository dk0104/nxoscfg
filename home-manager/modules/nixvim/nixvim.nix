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
    colorschemes.catppuccin.enable = true;
    viAlias = true;
    vimAlias = true;
    luaLoader.enable = true;
  };


}
