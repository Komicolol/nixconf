# yay, i love like 256gb of extra storage!!!

{ pkgs, lib, config, ... }: {
  options = {
    ineedstorage.enable =
      lib.mkEnableOption "enables storage";
  };

  config = lib.mkIf config.ineedstorage.enable {

    # I'm not gonna lie, this look like too much effort LMAO
    # Just use syncthing or smth like idk man..
    services.samba = {
      enable = true;
      openFirewall = true;
      settings = {
        global = {
            "workgroup" = "WORKGROUP";
            "server string" = "smbnix";
            "netbios name" = "smbnix";
            "security" = "user";
            #"use sendfile" = "yes";
            #"max protocol" = "smb2";
            # note: localhost is the ipv6 localhost ::1
            "hosts allow" = "192.168.0. 127.0.0.1 localhost";
            "hosts deny" = "0.0.0.0/0";
            "guest account" = "nobody";
            "map to guest" = "bad user";
          };
          "smbshare" = {
            "path" = "/home/komico/smbshare";
            "browseable" = "yes";
            "read only" = "no";
            "guest ok" = "no";
            "create mask" = "0644";
            "directory mask" = "0755";
            "force user" = "username";
            "force group" = "groupname";
          };
      };
    };
  };
}
