{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
  ];

  users = {
    mutableUsers = false; # always allow setting users' passwords from NixOS configuration files.
    users = {
      val = {
        isNormalUser = true;
        hashedPasswordFile = "/home/nixos/users/pwd/val-pwd";
        extraGroups = ["wheel" "networkmanager"]; # Enable ‘sudo’ for the user.
        shell = pkgs.fish;
      };

      kanna = {
        isNormalUser = true;
        hashedPasswordFile = "/home/nixos/users/pwd/kanna-pwd";
        extraGroups = ["wheel" "networkmanager"]; # Enable ‘sudo’ for the user.
        shell = pkgs.fish;
      };
    };
  };
}
