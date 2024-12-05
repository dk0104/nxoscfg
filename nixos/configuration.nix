# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./packages.nix
    ./modules/bundle.nix
    ];

    # Use the systemd-boot EFI boot loader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.kernelParams = ["xe.force_probe=46a8"];

    # Filesystem setup for btrfs
    fileSystems = {
	    "/".options = [ "compress=zstd" ];
	    "/home".options = [ "compress=zstd" ];
	    "/nix".options = [ "compress=zstd" "noatime" ];
    };
    services.btrfs.autoScrub.enable = true;

    networking.hostName = "dkws"; # Define your hostname.
    time.timeZone = "Europe/Samara";

    # Bluetooth support
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Sockeet";
          Expirimental = true;
        };
      };
    };

    # Intel graphics
    nixpkgs.config.packageOverrides = pkgs: {
      intel-vaapi-driver = pkgs.intel-vaapi-driver.override { enableHybridCodec = true; };
    };
    hardware.graphics = { # hardware.graphics on unstable
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      intel-vaapi-driver # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      libvdpau-va-gl
    ];
    };
    environment.sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; };
    virtualisation.virtualbox.host.enable =  true;




    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";
    # console = {
      #   font = "Lat2-Terminus16";
      #   keyMap = "us";
      #   useXkbConfig = true; # use xkb.options in tty.
      # };

      # cache hypr build
      nix.settings = {
        substituters = ["https://hyprland.cachix.org"];
        trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
        experimental-features = ["nix-command"];
      };

      #Garbage colector
      nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
      };

      system.autoUpgrade = {
        enable = true;
        channel = "https://nixos.org/channels/nixos-23.05";
      };

      #xdg
      xdg.portal = {
        enable = true;
        xdgOpenUsePortal = false;
        #gtkUsePortal = true;
        extraPortals = with pkgs; [
          # xdg-desktop-portal-gtk
          xdg-desktop-portal-hyprland
          #xdg-desktop-portal-wlr
        ];
        #wlr.enable = true;
      };



      services.openssh.enable = true;
      system.stateVersion = "24.05"; # Did you read the comment?
}

