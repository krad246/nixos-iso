{
  ezModules,
  lib,
  ...
}: {
  imports = with ezModules; [nixos gnome-iso flake-registry];

  networking.hostName = "nixos-iso-installer";
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
