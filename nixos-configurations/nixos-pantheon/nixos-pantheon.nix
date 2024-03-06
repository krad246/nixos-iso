{
  inputs,
  ezModules,
  ...
}: let
  inherit (inputs) nixos-hardware;
in {
  imports = (with ezModules; [efiboot nixos pantheon-desktop flake-registry]) ++ (with nixos-hardware.nixosModules; [common-cpu-amd common-gpu-amd common-pc common-pc-ssd]);
  networking.hostName = "nixos-pantheon";
}
