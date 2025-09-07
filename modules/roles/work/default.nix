{pkgs, lib, ...}: {
  environment.systemPackages = lib.attrValues {
    inherit
    (pkgs)
    libreoffice
    hunspell
    ;
    inherit(pkgs.hunspellDicts)
    en_US
    fr-moderne # Spelling correction
    ;
  };

  programs = {
    thunderbird.enable = true;
  };
}
