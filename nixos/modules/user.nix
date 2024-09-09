{ pkgs,lib, ... }: {
  programs.zsh.enable = true;
  users = {
    defaultUserShell = pkgs.zsh;
    groups.dk = {};
    users.dk = {
      isNormalUser = true;
      description = "Denis Keksel";
      extraGroups = ["audio" "networkmanager" "wheel" "input" "libvirtd" ];
      group = "dk";
    };
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "dk";

}
