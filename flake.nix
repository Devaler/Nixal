{
  description = "My computer Flake";

  inputs = {
    # NixOS official package source, using the nixos-unstable branch here
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # Adding raf's nvf, nix wrapper for neovim
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
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
