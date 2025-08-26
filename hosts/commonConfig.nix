{
  config,
  lib,
  ...
}: let
  inherit (lib) mkDefault;
in {
  boot.loader.systemd-boot.enable = mkDefault true;
  hardware.enableRedistributableFirmware = mkDefault true;
  networking.useDHCP = lib.mkDefault true; # Idk if i should use this but idc


  fileSystems = {
    "/" = {
      device = mkDefault "/dev/disk/by-label/nixos"; # Maybe add a warning?
      fsType = "ext4";
      options = ["x-gvfs-show"]; # Make disk visible in file explorer
    };

    "/boot" = {
      device = mkDefault "/dev/disk/by-label/boot";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077" "x-gvfs-show"];
    };
  };
}
