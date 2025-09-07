{pkgs, ...}: {
  environment.systemPackages = lib.attrValues {
    inherit (pkgs)
    stremio
    ;
  };
}
