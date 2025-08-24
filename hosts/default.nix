{
    inputs,
    ...
}: let
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
