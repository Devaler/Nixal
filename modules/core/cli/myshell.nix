{
pkgs,
...
}: {
  programs.zsh = {
        enable = true;
        ohMyZsh.enable = true;
    };
  users.defaultUserShell = pkgs.zsh;

  environment.shellAliases = {
        # Lot of aliases from woke blob https://git.poz.pet/poz/niksos/src/branch/main/modules/cli/zsh.nix
        cp = "cp -irv";
        mv = "mv -iv";
        untar = "tar -xvf";
        untargz = "tar -xzf";
        open = "xdg-open";
        ":q" = "exit"; # ':q' could seem like a stolen idea but i thought of it on my own...
    };
}
