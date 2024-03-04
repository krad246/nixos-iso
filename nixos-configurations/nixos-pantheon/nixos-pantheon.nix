{ezModules, ...}: {
  imports = with ezModules; [efiboot nixos pantheon-desktop flake-registry];
  networking.hostName = "nixos-pantheon";
}
