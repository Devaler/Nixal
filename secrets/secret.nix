let
    devaler = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIINWmrbJCH7DF6PCZsZJdBBwA1Pzs9gwIxmxCmxYUGjp devaler@nixos";
    users = [devaler];
in {
    "test.age".publicKeys = [ devaler ];
}
