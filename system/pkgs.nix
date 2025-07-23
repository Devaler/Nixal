{ config, pkgs, lib, ... }:

{
# enable programs
  programs = {
    neovim = { # Text editor
      enable = true;
      defaultEditor = true;
      viAlias = true;
    };

    yazi = { # CLI file manager
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

    fish.enable = true; # Shell
    tmux.enable = true; # Workflow
    nh.enable = true; # "Nix Helper"
  };

  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

# import packages
  environment.systemPackages = with pkgs; [

    #utils
    wget
    jq
    fd
    tree
    brightnessctl
  ];

}
