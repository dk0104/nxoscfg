{ pkgs,lib, ... }: {
  programs.zsh.enable = true;
  users = {
    defaultUserShell = pkgs.zsh;
    users.dk = {
      isNormalUser = true;
      description = "Denis Keksel";
      extraGroups = ["audio" "networkmanager" "wheel" "input" "libvirtd" ];
    };
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "dk";
}

