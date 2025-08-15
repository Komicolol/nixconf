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

    firewall.trustedInterfaces = [ "virbr0" ]; # for virt-manager, because internet jsut stops working all of the sudden?????

  };
}
