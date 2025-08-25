{
  config,
lib,
pkgs,
...
}: {
  boot.loader.systemd-boot.enable = lib.mkDefault true;
}
