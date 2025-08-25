{
    inputs,
    ...
}: let
# Copy raf description?
modulesPath = ../modules;

rolesPath = modulesPath + /roles;
# Roles
gaming = rolesPath + /gaming;
works = rolesPath + /work;

mkHost = {architecture, roles} :
    inputs.nixpkgs.lib.nixosSystem {
        system = architecture;
        modules = roles;
    };
in {
    test = mkHost {
        architecture = "x86_64-linux";
        roles = [ ];
    };
}
