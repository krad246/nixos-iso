{ezModules, ...}: {
  imports = with ezModules; [efiboot nixos flake-registry];
  networking.hostName = "nixos-pantheon";
}
