{pkgs, ...}: {
  services = {
    ollama = {
      # Local AI tests
      enable = true;
      loadModels = ["deepseek-coder:1.3b"];
    };
    open-webui.enable = true;
  };
}
