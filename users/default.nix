{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
  ];

  # Enable passwordless sudo for wheel users
  security.sudo.wheelNeedsPassword = false;

  users = {
    users = {
      kanna = {
        isNormalUser = true;
        extraGroups = ["wheel" "networkmanager"]; # Enable ‘sudo’ for the user.
        shell = pkgs.fish;
      };
    };
  };
}
