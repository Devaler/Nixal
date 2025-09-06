{
  lib,
  pkgs
}: {
  environment.SystemPackages = lib.attrsValues {
    inherit
      (pkgs)
      prismlauncher
      ;
  };

  programs = {
    steam.enable = true;
  };
}
