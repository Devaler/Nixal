{ config, lib, pkgs, ... }:

let commonPackages = with pkgs; [
  hyprshot hyprpaper # Hypr* suite
  rofi-wayland # Application launcher
  kdePackages.dolphin # Files manager
  kitty # My favorite terminal!
  libreoffice
  hunspell hunspellDicts.en_US hunspellDicts.fr-moderne # Spelling correction
];
in

{
  imports =
    [
    ];

  users = {
    mutableUsers = false; # always allow setting users' passwords from NixOS configuration files.
    users = {

      val = {
        isNormalUser = true;
        hashedPasswordFile = "/home/nixos/users/pwd/val-pwd";
        extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
        packages = with pkgs; [
        ] ++ commonPackages;
        shell = pkgs.fish;
      };

      kanna = {
        isNormalUser = true;
        hashedPasswordFile = "/home/nixos/users/pwd/kanna-pwd";
        extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
        packages = with pkgs; [
          stremio
          prismlauncher
        ] ++ commonPackages;
        shell = pkgs.fish;
      };
    };
  };

# enable programs
  programs = {
    hyprland.enable = true;
    firefox.enable = true;
    steam.enable = true;
    thunderbird.enable = true;
  };

# allow unfree software
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "stremio-shell" "stremio-server"
    "steam" "steam-original" "steam-unwrapped" "steam-run"
  ];

}
