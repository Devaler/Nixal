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


    # Define a user account. Don't forget to set a password with ‘passwd’.    

  users.users.val = {
    isNormalUser = true;
    hashedPassword = "$y$j9T$g5nrw8w.d0XJ5DpemL5XV0$/D/QpFPtw2hs1/3c92wqxG68hu6yNvxmwWOMRA78tp8";
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
    ] ++ commonPackages;
    shell = pkgs.fish;
  };


  users.users.kanna = {
    isNormalUser = true;
    hashedPassword = "$y$j9T$f/v5T8WNQwojyXIBThrpF1$8FJ7c.u0zYU9YzIsr/f3UNnhqdsp5wFFvbKgkzL5X17";
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      stremio
      prismlauncher
    ] ++ commonPackages;
    shell = pkgs.fish;
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
