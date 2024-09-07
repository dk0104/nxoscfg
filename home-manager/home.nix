{hyprland, pkgs, ...}:{
  imports = [
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
        hyprlandPlugins.hy3
        hyprlandPlugins.hyprexpo
        hyprlock
        hypridle
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
        mplayer
        vlc
        blueman
        networkmanagerapplet
        papirus-icon-theme
        nwg-launchers
        libtool
  ]);
  programs.home-manager.enable = true;
}
