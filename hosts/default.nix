{inputs}: let
  modulesPath = ../modules;

  rolesPath = modulesPath + /roles;
  # Roles
  work = rolesPath + /work;
  medias = rolesPath + /medias;
  gaming = rolesPath + /gaming;

  # Probably add an hardwarePath and hardware in mkHost

  commonConfig = modulesPath + /core;

  mkHost = {
    host,
    architecture,
    hardware,
    roles,
  }: {
    ${host} = inputs.nixpkgs.lib.nixosSystem {
      system = architecture;
      modules =
        roles
        ++ [
          commonConfig
          ../secrets
          ./${host}
          inputs.agenix.nixosModules.default
          inputs.nixos-hardware.nixosModules.${hardware}
          inputs.nvf.nixosModules.default
        ];
    };
  };

  hosts = [
    {
      host = "xixi";
      architecture = "x86_64-linux";
      hardware = "lenovo-thinkpad-x1-7th-gen";
      roles = [medias gaming work];
    }
  ];
in
  builtins.foldl' (a: b: a // b) {} (map mkHost hosts)
# This creates a list of AttrSets with `map`, which we then transform in 1 AttrSet
# with `foldl'`
