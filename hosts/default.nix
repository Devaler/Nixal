{
    inputs,
    ...
}: let
modulesPath = ../modules;

rolesPath = modulesPath + /roles;
# Roles
gaming = rolesPath + /gaming;
works = rolesPath + /work;

commonConfig = modulesPath + /commonConfig.nix;
mkHost = {architecture, roles} :
    inputs.nixpkgs.lib.nixosSystem {
        system = architecture;
        modules = roles ++ [commonConfig];
    };
in {
    test = mkHost {
        architecture = "x86_64-linux";
        roles = [ ];
    };
}
