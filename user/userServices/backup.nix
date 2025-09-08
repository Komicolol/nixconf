{ config, lib, pkgs, ... }:

let
  cfg = config.user.services.backup;
in
{
  options.user.services.backup.enable = lib.mkEnableOption "backing up stuff";
  config = lib.mkIf cfg.enable {
    systemd.user.timers."backups-to-copyparty" = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = "hourly";
        Persistent = true;
        Unit = "backups-to-copyparty.service";
      };
    };

    systemd.user.services."backups-to-copyparty" = {
      description = "soemthing";
      path = with pkgs; [ bash rclone ];
      script = ''
         bash $HOME/.config/bin/backup.sh # something someting it's a secret lmao
      '';
      serviceConfig.type = "oneshot"; # dumbass LMAOOOo
    };
  };
}
