{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Probably put boot loader config in its own file cuz lot of stuff?
  # mkOverride 999 is ONLY for users.defaultUserShell. 
  config = lib.mkOverride 999 {
    boot.loader = {
      efi.canTouchEfiVariables = true; # Not sure if useful?
      grub = {
        efiSupport = true;
        device = "nodev";
      };
    };

    # Hardware
    fileSystems = {
      "/" = {
        device = "/dev/disk/by-label/nixos"; # Maybe add a warning?
        fsType = "ext4";
        options = ["x-gvfs-show"]; # Make disk visible in file explorer
      };

      "/boot" = {
        device = "/dev/disk/by-label/boot";
        fsType = "vfat";
        options = ["fmask=0077" "dmask=0077" "x-gvfs-show"];
      };
    };

    hardware.enableRedistributableFirmware = true;

    # Network
    networking.useDHCP = true; # Idk if i should use this but idc

    # Miscellaneous
    programs.zsh.enable = true;
    users.defaultUserShell = pkgs.zsh; # use mkdefault if removed?
    nixpkgs.config.allowUnfree = true;
  };
}
