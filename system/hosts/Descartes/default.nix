{ lib, config , options, ... }:

{
  services.thinkfan = {
    enable = true;
    sensors = # Those may change depending on machine, idk yet
      [
      # Primary: Coretemp sensors, supposedly more reliable
      { type = "hwmon"; query = "/sys/class/hwmon/hwmon7/temp1_input"; }
    ];
    levels = [
      [0 0  40]
      [1 40 45]
      [3 45 55]
      [5 55 65]
      [7 65 32767]
    ];
  };
}
