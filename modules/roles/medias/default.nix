{pkgs, lib, ...}: {
  environment.systemPackages = lib.attrValues {
    inherit (pkgs)
    stremio
    ;
  };
}
