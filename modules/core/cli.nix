{
  pkgs
}:
{
    programs.zsh.enable = true;
    users.defaultUserShell = pkgs.zsh; # use mkdefault if removed?
}
