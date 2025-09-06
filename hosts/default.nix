{inputs, ...}: let
  modulesPath = ../modules;

  rolesPath = modulesPath + /roles;
  # Roles
  gaming = rolesPath + /gaming;
  work = rolesPath + /work;

  # Probably add an hardwarePath and hardware in mkHost

  commonConfig = ./commonConfig.nix;
#   mkHost = {
#     architecture,
#     roles,
#   }:
#     inputs.nixpkgs.lib.nixosSystem {
#       system = architecture;
#       modules = roles ++ [commonConfig inputs.nvf.nixosModules.default];
#     };
# in {
#   xixi = mkHost {
#     architecture = "x86_64-linux";
#     roles = [];
#   };
# }


  mkHost = { host, architecture, roles }: {
    ${host} = inputs.nixpkgs.lib.nixosSystem {
      system = architecture;
      modules = roles ++ [commonConfig ./${host} inputs.nvf.nixosModules.default];
    };
  };

  hosts = [
    {
    host = "xixi";
    architecture = "x86_64-linux";
    roles = [];
  }
  ];
in builtins.foldl' (a: b: a // b) {} (map mkHost hosts)
