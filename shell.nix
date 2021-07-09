let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs {};
in

with pkgs;

mkShell {
  name = "orgdapp-shell";
  buildInputs =
  let orgdapp = (import ./orgdapp.nix).orgdapp;
    in
    with pkgs; [
      python3Packages.black
      orgdapp
    ];

  shellHook = ''
    export NIX_PATH="nixpkgs=${toString sources.nixpkgs}"
    export LD_LIBRARY_PATH="${libvirt}/lib:$LD_LIBRARY_PATH"
  '';
}
