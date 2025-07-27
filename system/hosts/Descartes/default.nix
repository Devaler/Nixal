{
  lib,
  config,
  options,
  ...
}: {
  services.thinkfan = {
    enable = true;
    levels = [
      [0 0 40]
      [1 40 45]
      [3 45 55]
      [5 55 65]
      [7 65 32767]
    ];
  };
}
