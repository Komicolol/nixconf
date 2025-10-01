# can't be without a reasonable text editor...
pkgs:
pkgs.mkShell {
  buildInputs = let
    myvi = pkgs.callPackage ./pkgs/myvi {};
  in [
    myvi
  ];
}
