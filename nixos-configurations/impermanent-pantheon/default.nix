{lib, ...}: {
  imports = [./nixos-pantheon.nix ./platform.nix ./filesystems.nix];
  networking.hostName = "nixos-pantheon";
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
