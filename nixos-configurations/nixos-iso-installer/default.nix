{
  ezModules,
  lib,
  ...
}: {
  imports = [ezModules.nixos ezModules.gnome-iso ezModules.flake-registry];
  networking.hostName = "nixos-iso-installer";
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
