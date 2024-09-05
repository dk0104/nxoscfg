{
  description = "dkws system config";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprland-plugins = {
       url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
  };

  outputs = inputs@ { self, nixpkgs, nixpkgs-stable, home-manager ,hyprland,hyprland-plugins,  ... }:{

  nixosConfigurations = {
      dkws = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit hyprland;
        inherit inputs;
      };
      modules = [
        ./nixos/configuration.nix
        hyprland.nixosModules.default

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
