{
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = lib.attrValues {
    inherit
      (pkgs)
      prismlauncher
      ;
  };

  programs = {
    steam.enable = true;
  };
}
