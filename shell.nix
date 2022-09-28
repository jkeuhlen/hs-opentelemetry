let
  pkgs = import ./nix/pkgs.nix {};
  settings = import ./nix/ghc.nix {};
in
  with pkgs;
  with settings;
  mkShell {
    buildInputs = [
      niv

      ghc
      cabal-install
      stack

      haskell.packages.${compiler}.implicit-hie
      haskell.packages.${compiler}.haskell-language-server
      haskell.packages.${compiler}.hspec-discover

      postgresql
      zlib
    ];
  }
