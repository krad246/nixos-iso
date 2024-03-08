{
  inputs,
  lib,
  ...
}: let
  inherit (inputs) home-manager;
in {
  imports =
    [./nixos-pantheon.nix ./platform.nix ./filesystems.nix ]
    ++ [
      home-manager.nixosModule
      {
        home-manager.useGlobalPkgs = true;
        home-manager.users.krad246 = import ../../home-configurations/krad246.nix;
      }
    ];

  networking.hostName = "nixos-pantheon";
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
