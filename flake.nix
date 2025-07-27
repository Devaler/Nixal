{
  description = "My computer Flake";

  inputs = {
    # NixOS official package source, using the nixos-unstable branch here
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # Adding raf's nvf, customized nvim for nix
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Adding zen-browser's flake
    zen = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs"; # Improve Zen starting time
    };
  };

  outputs = {
    self,
    nixpkgs,
    nvf,
    ...
  } @ inputs: {
    nixosConfigurations.v = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Import folders
        ./system
        ./users
        ./pkgs
        # Import module for options
        nvf.nixosModules.default
      ];
    };
  };
}
