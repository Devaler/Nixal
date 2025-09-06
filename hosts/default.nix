{inputs, ...}: let
  modulesPath = ../modules;

  rolesPath = modulesPath + /roles;
  # Roles
  gaming = rolesPath + /gaming;
  work = rolesPath + /work;

  # Probably add an hardwarePath and hardware in mkHost

  commonConfig = ./commonConfig.nix;
  mkHost = {
    architecture,
    roles,
  }:
    inputs.nixpkgs.lib.nixosSystem {
      system = architecture;
      modules = roles ++ [commonConfig ./test.nix];
    };
in {
  test = mkHost {
    architecture = "x86_64-linux";
    roles = [];
  };
}
