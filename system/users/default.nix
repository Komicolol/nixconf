{
  config,
  lib,
  pkgs,
  ...
}: {
  users = {
    # probably change this to true if you wanna set the passwd manually.
    mutableUsers = false;
    users = {
      root = {
        # change or remove this.
        hashedPasswordFile = config.sops.secrets.rootpasswd.path;
      };
      komico = {
        isNormalUser = true;
        description = "komico";
        # Use ur own password file or just remove it.
        hashedPasswordFile = config.sops.secrets.komico-passwd.path;
        extraGroups = [
          "networkmanager"
          "wheel"
          "input"
          "uinput"
          "docker"
          "minecraft"
          "mysql"
          "libvirtd"
          "adbusers"
          "gitea"
        ];
        shell = pkgs.zsh;
        openssh.authorizedKeys.keys = [
          # if you are gonna use this config (dont.), probably change this.
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINe7nKpSZT4fTO1sJoJLGhRJVBX6EnvZOmC9a3A7NHz3"
        ];
      };
    };
  };

  # wow! I don't know if i still need this or not anymore...
  programs.zsh.enable = true;

  # either remove this or get ur own secrets file and replace it.
  sops.secrets.rootpasswd = {
    sopsFile = ./secrets.yaml;
    neededForUsers = true;
  };
  sops.secrets.komico-passwd = {
    sopsFile = ./secrets.yaml;
    neededForUsers = true;
  };
}
