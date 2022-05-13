{
  description = "window menu for my xmonad configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:numtide/flake-utils";
    };
  };

  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
        rec {
          defaultApp = apps.windowmenu;
          defaultPackage = packages.windowmenu;
          devShell = packages.windowmenu.overrideAttrs (prev: {
            buildInputs = with pkgs; prev.buildInputs ++ [
              gnumake
              valgrind
              # needed for clangd lsp integration
              (runCommand "cDependencies" {} ''
                mkdir -p $out/include
                cp -r ${gtk4.dev}/include/gtk-4.0/* $out/include
                cp -r ${glib.dev}/include/glib-2.0/* $out/include
              '')
            ];
            shellHook = ''
              NIX_CFLAGS_COMPILE="$(pkg-config --cflags gtk4) $NIX_CFLAGS_COMPILE"
            '';
          });

          apps.windowmenu = {
            type = "app";
            program = "${defaultPackage}/bin/windowmenu";
          };
          packages.windowmenu = pkgs.stdenv.mkDerivation {
            name = "windowmenu";
            pname = "windowmenu";
            version = "1.0";
            src = ./src;
          
            nativeBuildInputs = [ pkgs.pkg-config ];
            buildInputs = with pkgs; [
              gtk4
              glib
            ];
            buildPhase = ''
              NIX_CFLAGS_COMPILE="$(pkg-config --cflags gtk4) $NIX_CFLAGS_COMPILE"
            '';
            makeFlags = [
              "DESTDIR=$(out)"
            ];
          };
        }
      );
}
# vim: tabstop=2 shiftwidth=2 expandtab
