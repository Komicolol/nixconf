{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    system.laptop.tlpSettings.enable =
      lib.mkEnableOption "laptop things, might change this later";
  };
  config = lib.mkIf config.system.laptop.tlpSettings.enable {
    services.tlp = {
      enable = true;
      settings = {
        # https://discourse.nixos.org/t/nixos-power-management-help-usb-doesnt-work/9933/7 - Stole from this person, sorry :(
        PLATFORM_PROFILE_ON_AC = "performance";
        PLATFORM_PROFILE_ON_BAT = "balanced";

        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 0;

        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_BAT = 30;
        CPU_MIN_PERF_ON_BAT = 0;

        USB_AUTOSUSPEND = 0;
        USB_BLACKLIST_WWAN = 1;

        WIFI_PWR_ON_AC = "off";
        WIFI_PWR_ON_BAT = "off";

        RESTORE_DEVICE_STATE_ON_STARTUP = 0;
        USB_EXCLUDE_BTUSB = 1;
        USB_EXCLUDE_PHONE = 1;

        RUNTIME_PM_ON_BAT = "on";
        RUNTIME_PM_ON_AC = "on";
      };
      # extraConfig = ''
      #   USB_AUTOSUSPEND=0
      # '';
    };
  };
}
