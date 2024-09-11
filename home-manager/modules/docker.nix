{config,pkgs , ...}:
let
  docker = pkgs.docker;
in
{
  programs.docker.enable = true;
  services.dokcer.start = true;
}
