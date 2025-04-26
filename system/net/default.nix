{
  config,
  lib,
  pkgs,
  ...
}: {
  networking = {
    networkmanager = {
      enable = true;
      wifi = {
        powersave = false;
      };
    };

    nameservers = ["1.1.1.1" "1.0.0.1"];

  };
}
