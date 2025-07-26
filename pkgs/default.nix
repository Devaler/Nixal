{ config, ... }:

{
  nixpkgs.config.allowUnfree = true; # allow unfree packages

  imports = [
    ./minimal
    ./GUI
    ./gamer
  ];
}
