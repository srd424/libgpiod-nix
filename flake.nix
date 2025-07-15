{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
# b134951a4c9f3c995fd7be05f3243f8ecd65d798
  };

  outputs = { self, nixpkgs }: 
  let
    inherit (nixpkgs) lib;
    forAllSystems = lib.genAttrs [ "x86_64-linux" "aarch64-linux" ];
  in {
    packages = forAllSystems (
      system:
      {
        libgpiod = nixpkgs.legacyPackages.${system}.callPackage ./package.nix { enable-dbus = true; };
        default = self.packages.${system}.libgpiod;
      }
    );

  };
}

# vim: set ts=2 sw=2 et sta:
