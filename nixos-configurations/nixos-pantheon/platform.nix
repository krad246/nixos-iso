{
  inputs,
  ezModules,
  ...
}: let
  inherit (inputs) nixos-hardware;
in {
  imports =
    [./hardware-configuration.nix ./filesystems.nix ./services.nix]
    ++ (with nixos-hardware.nixosModules; [
      common-cpu-amd
      common-gpu-amd
      common-pc
      common-pc-ssd
    ]);
}
