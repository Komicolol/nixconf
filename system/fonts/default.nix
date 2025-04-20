{
  config,
  lib,
  pkgs,
  ...
}: {
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
    icomoon-feather
  ];
}
