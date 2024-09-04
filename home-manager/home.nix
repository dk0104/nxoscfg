{
  imports = [
    ./zsh.nix
    ./modules/bundle.nix
  ];

  home = {
    username = "dk";
    homeDirectory = "/home/dk";
    stateVersion = "24.11";
  };
  programs.home-manager.enable = true;
}
