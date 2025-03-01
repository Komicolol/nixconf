# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # enable flakes you doofus
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
	
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-ca6cc950-61d2-43a5-b97a-025074e83e79".device = "/dev/disk/by-uuid/ca6cc950-61d2-43a5-b97a-025074e83e79";
  networking.hostName = "amogus"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.nameservers = [ "1.1.1.1" "9.9.9.9" ];

  # Set your time zone.
  time.timeZone = "Australia/Perth";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_AU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.picom.enable = true;

  # Enable the XFCE Desktop Environment.
  services.xserver.desktopManager.xfce.enable = true;
  services.xserver.displayManager.sddm = {
    enable = true;
    theme = "catppuccin-mocha";
    package = pkgs.kdePackages.sddm;
  };

  

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "au";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # bluetooth shit
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.komico = {
    isNormalUser = true;
    description = "komico";
    extraGroups = [ "networkmanager" "wheel" "input" "uinput" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "komico";

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
       neovim 
       git				# git fetch bitches
       wget				# do you use this?
       curl				# *random script go!*
       hyprland				# uwu
       kdePackages.sddm				# LET ME THE FUCK INNNN
       kitty				# why, you have wezterm?
       wezterm				# why, you have kitty?
       hyprpaper			# wallpaper yes!
       hypridle				# bye!
       yazi				# what are you, a nerd?
       osu-lazer-bin			# click the circles!
       picom				# x11 thing
       rofi-wayland-unwrapped 		# app launcher
       ncmpcpp				# so fuck spotify huh?
       spotify				# are you special in the head??
       btop				# resource monitor, like htop but cooler
       stow				# oh wow you're so cool huh symlinking dotfiles
       webex				# ew meetings
       keepassxc			# definately not a normal password manager
       starship				# by "ricing", you mean stealing configs?
       cava				# music go brrly
       gvfs				# i actually don't know what this does lol
       zip
       unzip
       ripgrep
       lua-language-server
       python3
       coreutils
       fd
       clang
       aspell
       (aspellWithDicts (dicts: with dicts; [
          en
	  en-computers
	  en-science
	  ]))
       catppuccin-sddm
       waybar
       hyprshot
       cowsay
       brightnessctl				# So you can change brightness :))) (its been 6 hours.)
       libreoffice				# documents not fun :(
       hyprlock					# you are a dumbass.
       fastfetch				# this legit does not do anything.
       kanata					# bc I can't get the service working lmao
       cmake 					# dev stuff (i just need vterm on emacs LOL)
       vesktop
       texliveFull
       gnumake
       libtool
       prismlauncher				# minecraft gaming
       yt-dlp					# downloading music bc why not
       obs-studio				# why not yknow
       feh					# xfce wallpaper
       vlc					# yup\
       dracula-icon-theme			# what a icon fr
       catppuccin-gtk				# :3333
       emacs29-pgtk	
       pyprland					# plugins for hyprland
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.mononoki
    nerd-fonts.symbols-only
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
    noto-fonts
    noto-fonts-emoji
    mononoki
    material-icons
    material-design-icons
    ];

  # roblox/minecraft bedrock LOL

  services.flatpak.enable = true;

  # games, infinite games, but no games
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  # GTK Theming :3 (need home-manager, but I won't use it until I get Flakes working)
  # gtk = {
  #   enable = true;
  #   package = pkgs.catpuccin-gtk;
  #   name = "catpuuccin-frappe-blue-standard+default";
  # };
  
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  services.syncthing = {
  enable = true;
  openDefaultPorts = true;
  user = "komico";
  dataDir = "/home/komico/";
  configDir = "/home/komico/.config/syncthing";
  };

  # doesn't work right now, everything works except when it plays music (bruh)

  services.mpd = {
    enable = true;
    musicDirectory = "/home/komico/Music";
    dataDir = "/home/komico/.config/mpd";
    extraConfig = ''
      audio_output {
        type "pipewire"
	name "My PipeWire Output"
       }
     '';
    user = "komico";
   };

  # local dumbass forgets about enabling hyprland
  programs.hyprland = {
  enable = true;
  xwayland.enable = true;
  };

  xdg.portal = {
  enable = true;
  extraPortals = [ pkgs.xdg-desktop-portal-gtk];
  };

  programs.thunar.plugins = with pkgs.xfce; [
  thunar-archive-plugin
  thunar-volman
  ];

  # for kanata thingy
  boot.kernelModules = [ "uinput" ];

  hardware.uinput.enable = true;
  
 
 services.udev.extraRules = ''
   KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
 '';


  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
