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
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  environment.SystemPackages = lib.attrsValues {
    inherit
    (pkgs)
    fd
    ripgrep
    fzf
    # alejandra
    # wget
    # curl
    # brightnessctl
    # jq
    ;
  };
}
