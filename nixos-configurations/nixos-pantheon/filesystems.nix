{inputs, ...}: let
  inherit (inputs) disko;
in {
  imports = [disko.nixosModules.disko] ++ [./simple-efi.nix];
}
