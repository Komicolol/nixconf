{ config, lib, pkgs, ... }:

{
  options = {
    devstuff.enable =
      lib.mkEnableOption "enables ur shit";
  };

  config = lib.mkIf config.devstuff.enable {
    environment.systemPackages = with pkgs; [
      stow
      ripgrep
      lua-language-server
      python3
      fd
      clang
      aspell
      (aspellWithDicts (dicts: with dicts; [
        en
        en-computers
        en-science
      ]))
      kanata
      cmake
      texliveFull
      gnumake
      libtool
      emacs30-pgtk
    ];
    # for kanata thingy
    boot.kernelModules = [ "uinput" ];
    hardware.uinput.enable = true;
    services.udev.extraRules = ''
      KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
    '';
    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

}
