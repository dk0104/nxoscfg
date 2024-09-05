{hyprland, pkgs, ...}:{
  imports = [
    ./modules/bundle.nix
    ./modules/zsh.nix
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
        hyprlandPlugins.hy3
        hyprlandPlugins.hyprexpo
        yq-go
        ripgrep
        eza
        emacs
        bat
        archi
        radioboat
        fd
        silver-searcher
        cheat
        pet
        starship
        pass
        xclip
  ]);
  programs.home-manager.enable = true;
}
