{
  inputs,
  ezModules,
  lib,
  ...
}: let
  inherit (inputs) home-manager;
in {
  imports = with ezModules;
    [nixos gnome-iso flake-registry]
    ++ [
      home-manager.nixosModule
      {
        home-manager.useGlobalPkgs = true;
        home-manager.users.nixos = import ../../home-configurations/nixos.nix;
      }
    ];

  networking.hostName = "nixos-iso-installer";
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
