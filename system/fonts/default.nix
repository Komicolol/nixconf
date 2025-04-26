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
    nerd-fonts.fira-code
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    mononoki
    material-icons
    material-design-icons
    icomoon-feather
    fira-code-symbols
  ];
  fonts.fontconfig.useEmbeddedBitmaps = true;
  fonts.enableDefaultFonts = true;
}
