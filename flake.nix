{
  description = "dkws system config";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hy3 = {
      url = "github:outfoxxed/hy3"; # where {version} is the hyprland release version
      # or "github:outfoxxed/hy3" to follow the development branch.
      # (you may encounter issues if you dont do the same for hyprland)
      inputs.hyprland.follows = "hyprland";
    }; 

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager ,hyprland, hy3, ... }:
  let 
    system = "x86_64-linux";
    pkgs = import nixpkgs { 
       inherit system;
       config.allowUnfree = true;
    };

    lib = nixpkgs.lib;
  in {

  nixosConfigurations = {
      dkws = lib.nixosSystem rec {
      inherit system;
      specialArgs = {
        inherit hyprland;
        inherit hy3;
      };
      modules = [
        ./nixos/configuration.nix
        hyprland.nixosModules.default

        home-manager.nixosModules.home-manager{
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.dk = import ./home-manager/home.nix;
          home-manager.extraSpecialArgs = specialArgs;
       }

      ];
    };
  };
 };
}
