{inputs, ...}: let
  inherit (inputs) disko;
in {
  imports =
    [disko.nixosModules.disko]
    ++ [
      ./disko-nvme1n1.nix
      ./impermanence.nix
    ];
}
