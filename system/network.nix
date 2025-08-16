{
  config,
  lib,
  ...
}: {
  networking = {
    wireless.iwd = {
      enable = true;
      settings = {
        Network.EnableIPv6 = true;
        General.AutoEnable = true;
        Settings.AutoConnect = true;
      };
    };
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
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

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;er on boot
}
