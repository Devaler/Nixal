{
  description = "My computer Flake";

  inputs = {
    # NixOS official package source, using the nixos-unstable branch here
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    # Adding zen-browser's flake
    zen-browser.url = "github:youwen5/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs"; # Improve Zen starting time
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.v = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./system
        ./users
      ];
    };
  };
}
