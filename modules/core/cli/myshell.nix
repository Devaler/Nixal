{
pkgs,
...
}: {
  programs.zsh = {
        enable = true;
        # autosuggestions.enable = true;
        syntaxHighlighting.enable = true;
        # enableCompletion = true;
        ohMyZsh = {
            enable = true;
            theme = "af-magic bira crunch darkblood fino-time fino fox gnzh";
        };
    };
  users.defaultUserShell = pkgs.zsh;

  environment.shellAliases = {
        # Lot of aliases from woke blob https://git.poz.pet/poz/niksos/src/branch/main/modules/cli/zsh.nix
        cp = "cp -irv";
        mv = "mv -iv";
        untar = "tar -xvf";
        untargz = "tar -xzf";
        open = "xdg-open";
        kys = "shutdown now";
        ":q" = "exit"; # ':q' could seem like a stolen idea but i thought of it on my own...
    };
}
