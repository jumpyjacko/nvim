{
  description = "@jumpyjacko's Neovim configurations as a flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:
    {
      packages.${builtins.currentSystem}.dotfiles = self;
    };
}
