{pkgs,inputs,config,lib, ...}:{
  imports = [
    ./modules/bundle.nix
    inputs.hyperland.homeManager.default
  ];

  home = {
    username = "dk";
    homeDirectory = lib.mkForce "/home/dk";
    packages = pkgs.callPackage ./packages.nix {};
    stateVersion = "24.11";
  };



 _module.args = { inherit inputs; };
  programs.home-manager.enable = true;
}
