{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # probably won't even use it ngl
    ./aiTypeShii.nix

    # same with this
    ./photosimmichyeah.nix

    # not for this one, i love mc <333
    ./minecraft.nix
    inputs.nix-minecraft.nixosModules.minecraft-servers

    # this, not so much.
    ./jellything.nix

    # i love miners!
    ./moneroyay.nix

    # books.
    ./calibre.nix
    ./calibre-server.nix

    # huh..
    ./mullvad.nix

    # gitea bc why not :3 (may change to forgejo if I get bored enough)
    ./gitea.nix
  ];
}
