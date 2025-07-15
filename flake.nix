{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
# b134951a4c9f3c995fd7be05f3243f8ecd65d798
  };

  outputs = { self, nixpkgs }: 
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    packages.x86_64-linux.libgpiod = pkgs.callPackage ./package.nix { };
    packages.x86_64-linux.default = self.packages.x86_64-linux.libgpiod;

  };
}

# vim: set ts=2 sw=2 et sta:
