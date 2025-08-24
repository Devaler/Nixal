{
  description = "WR longest eval times possible";

  outputs = {nixpkgs, ...} @ inputs: {
    nixosConfigurations = import ./hosts {inherit inputs;};
    # test if inputs is necessary
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nvf = {
        url = "github:NotAShelf/nvf";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
