{pkgs, lib, ...}: {
  imports = [
  ];

  environment.systemPackages = lib.attrValues {
    inherit (pkgs)
    hyprshot
    hyprpaper # Hypr* suite
    rofi # Application launcher
    pcmanfm # Files manager
    kitty # My favorite terminal!
    ;
  };

  programs = {
    hyprland.enable = true;
    firefox.enable = true;
  };
}
