{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = (import ./replit.nix { pkgs = pkgs; }).deps;
}
