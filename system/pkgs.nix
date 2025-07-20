{ config, pkgs, lib, ... }:

{
# enable programs
  programs = {
    neovim = { enable = true; defaultEditor = true;}; # Text editor
    yazi.enable = true; # CLI file manager
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
