{
  description = "dkws system config";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =  { self, nixpkgs, home-manager ,  ... } @ inputs: let
    inherit (self) outputs;
    system = "x86_64-linux";
  in
  {
    nixosConfigurations = {
      dkws = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
        };
        modules = [
          ./nixos/configuration.nix
          home-manager.nixosModules.home-manager{
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.dk = import ./home-manager/home.nix;
            home-manager.extraSpecialArgs = {inherit inputs outputs;};
          }

        ];
      };
    };
  };
}
