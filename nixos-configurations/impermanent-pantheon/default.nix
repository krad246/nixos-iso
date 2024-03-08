{lib, ...}: {
  imports = [./nixos-pantheon.nix ./platform.nix ./filesystems.nix ./hardware-configuration.nix];

  networking.hostName = "impermanent-pantheon";
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
