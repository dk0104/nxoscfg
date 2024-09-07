{
  description = "dkws system config";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    stylix.url = "github:danth/stylix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
  };

  outputs = inputs@ { self, nixpkgs, nixpkgs-stable, home-manager ,hyprland, stylix, ... }:{

  nixosConfigurations = {
      dkws = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit hyprland;
        inherit inputs;
      };
      modules = [
        hyprland.nixosModules.default
        stylix.nixosModules.stylix
        ./nixos/configuration.nix

        home-manager.nixosModules.home-manager{
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.dk = import ./home-manager/home.nix;
          home-manager.extraSpecialArgs = inputs;
       }

      ];
    };
  };
 };
}
