{
config,
pkgs,
lib,
...
}: {
  imports = [
    ./myshell.nix # This is a WIP name...
    ./git.nix
    ./editor.nix
  ];

  environment.systemPackages = lib.attrValues {
    inherit
    (pkgs)
    fd # Better find
    ripgrep # Better grep in multiple files
    fzf # 'Fuzzyfinder'
    # alejandra
    # wget
    # curl
    brightnessctl
    jq
    ;
  };

  programs = {
    zoxide.enable = true; # Better `cd`
    yazi.enable = true; # File manager
  };
}
