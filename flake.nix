{
  description = "dkws system config";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@ { self, nixpkgs, home-manager ,  ... }:{

    nixosConfigurations = {
      dkws = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
        };
        modules = [
          inputs.hyprland.nixosModules.default
          ./nixos/configuration.nix
          inputs.nixvim.nixosModules.nixvim

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
