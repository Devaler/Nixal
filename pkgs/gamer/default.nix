{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    prismlauncher
  ];

# enable programs
  programs = {
    steam.enable = true;
  };
}
