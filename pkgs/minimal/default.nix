{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    # for big configurations
    ./nvim.nix
  ];

  environment.systemPackages = with pkgs; [
    #utils
    wget # CLI downloader
    jq # A json parser, also used in one of my hyprland keybinds
    fd
    ripgrep
    fzf # The find trinity
    tree # output file tree
    brightnessctl
    alejandra # nix formatter
  ];

  # programs.<program> offers more configuration than environment.systemPackages. Not all programs have such modules, sadly.
  programs = {
    fish.enable = true; # Shell with auto-completion
    tmux.enable = true; # Terminal multiplexer
    fzf = {}; # "Fuzzyfinder"
    nh.enable = true; # "Nix Helper"

    yazi = {
      # CLI file manager
      enable = true;
      flavors = {
        dark = pkgs.fetchFromGitHub {
          owner = "bennyyip";
          repo = "gruvbox-dark.yazi";
          rev = "main";
          sha256 = "sha256-RWqyAdETD/EkDVGcnBPiMcw1mSd78Aayky9yoxSsry4=";
        };
      };
      settings.theme.flavor.dark = "dark";
    };

    git = {
      enable = true;
      config = {
        user = {
          name = "v";
          email = "<>";
        };
      };
    };
  };
}
