# things that MIGHT be cross platform, i don't actually know tho...
{ pkgs, lib, ... }: {

  imports = [
    ./wmde 
    ./gaming 
    ./terminal 
    ./devstuff 
  ];
}
