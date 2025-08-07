{pkgs, ...}:
{
  services = {
    xserver = {
      enable = true;
      displayManager.startx.enable = true;
      windowManager.dwm = {
        enable = true;
      };
    };
  };
}
