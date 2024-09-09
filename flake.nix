{
  description = "dkws system config";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "git+https://github.com/hyprwm/Hyprland";
    catppuccin-toolbox.url = "github:catppuccin/toolbox";

  };

  outputs = inputs@{
    self,
    nixpkgs,
    home-manager ,
    hyprland,
    ...
  } : let
    overlays = {pkgs, ...}:{
      nixpkgs.overlays = with inputs; [
      #  (self: super: {
      #    waybar = super.waybar.overrideAttrs (oldAttrs: {
      #      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      #    });
      #  })
      ];
    };
    config = {
      allowUnfree = true;
    };
    system = "x86_64-linux";

  in {

    nixosConfigurations = {
      dkws = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs =  {
          inherit inputs;
          inherit hyprland;
        };
        modules = [
          home-manager.nixosModules.home-manager{
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.dk = import ./home-manager/home.nix;
            home-manager.extraSpecialArgs = inputs;
          }

#          hyprland.nixosModules.default
          ./nixos/hardware-configuration.nix
        ];
      };
    };
  };
}
