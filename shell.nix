{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  packages = [pkgs.gcc pkgs.love pkgs.python312Packages.flet];

  inputsFrom = [];

  shellHook = ''
    echo "Welcome to my shell! 🐣"
  '';
}
