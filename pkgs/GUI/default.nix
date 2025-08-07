{pkgs, ...}: {
  imports = [
        ./dwm.nix
        ];

  environment.systemPackages = with pkgs; [
    stremio
    hyprshot
    hyprpaper # Hypr* suite
    rofi-wayland # Application launcher
    kdePackages.dolphin # Files manager
    kitty # My favorite terminal!
    libreoffice
    hunspell
    hunspellDicts.en_US
    hunspellDicts.fr-moderne # Spelling correction
  ];

  programs = {
    hyprland.enable = true;
    firefox.enable = true;
    thunderbird.enable = true;
  };
}
