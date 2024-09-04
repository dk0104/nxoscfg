{ pkgs, ... }: {
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;

    users.dk = {
      isNormalUser = true;
      description = "Denis Keksel";
      extraGroups = ["audio" "networkmanager" "wheel" "input" "libvirtd" ];
      packages = with pkgs; [
        zoxide
        pavucontrol
      ];
    };
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "dk";
}
