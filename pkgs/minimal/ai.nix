{pkgs, ...}: {
  services = {
    ollama = {
      # Local AI tests
      enable = true;
    };
    # open-webui.enable = true;
  };
}
