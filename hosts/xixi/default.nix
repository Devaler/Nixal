{
  pkgs,
  ...
}: {
  # Probably move (modularize?) this networking section?
  networking = {
    hostName = "xixi";
    wireless.iwd = {
      enable = true;
      settings.General.AutoEnable = true;
    };
  };
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth c
  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
    };
  };

  users.users.devaler = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
  };

    # Fingerprint reader: login and unlock with fingerprint (if you add one with `fprintd-enroll`)
    services.fprintd.enable = true;

  swapDevices = [
    {
      device = "/swapfile";
      size = 16 * 1024; # 16GB
    }
  ];

  system.stateVersion = "25.05";
}
