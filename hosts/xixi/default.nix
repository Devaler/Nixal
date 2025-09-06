{
  config,
  pkgs,
  ...
}:
{
  users.users.devaler = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
  };

  system.stateVersion = "25.05";
}
