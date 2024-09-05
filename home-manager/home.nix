{hyprland, pkgs, ...}:{
  imports = [
    ./zsh.nix
    ./modules/bundle.nix
    hyprland.homeManagerModules.default
  ];

  home = {
    username = "dk";
    homeDirectory = "/home/dk";
    stateVersion = "24.11";
  };

  home.packages = (with pkgs; [
        zoxide
        pavucontrol
        walker
  ]);
  programs.home-manager.enable = true;
}
