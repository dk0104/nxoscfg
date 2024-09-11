{
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
    rootless.enable = true;
    rootless.setSocketVariable = true;
  };
}
