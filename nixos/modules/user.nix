{ pkgs,lib, ... }: {
  programs.zsh.enable = true;
  users = {
    defaultUserShell = pkgs.zsh;
    groups.dk = {};
    users.dk = {
      isNormalUser = true;
      description = "Denis Keksel";
      extraGroups = ["audio" "networkmanager" "wheel" "input" "libvirtd" "docker" ];
      group = "dk";
    };
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "dk";
  services.emacs = {
    enable = true;
    package = pkgs.emacs;
  };
  #virtualisation.docker.enable = true;

}
