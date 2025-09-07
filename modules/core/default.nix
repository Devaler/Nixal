{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./cli
    ./gui
  ];
  config = lib.mkDefault {
    # Probably put boot loader config in its own file cuz lot of stuff?
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

    # Audio
    services.pipewire = {
      enable = true;
      pulse.enable = true;
    };

    # Locales
    time.timeZone = "Europe/Paris";
    console.keyMap = "fr";

    # Miscellaneous
    services.printing.enable = true;
    services.dbus.implementation = "broker"; # Better DBus.
    nixpkgs.config.allowUnfree = true;
  };
}
