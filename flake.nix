{
  description = "dkws system config";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@ { self, nixpkgs, home-manager ,hyprland,  ... }:{

  nixosConfigurations = {
      dkws = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit hyprland;
        inherit inputs;
      };
      modules = [
        hyprland.nixosModules.default
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
