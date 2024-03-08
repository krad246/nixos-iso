{inputs, ...}: let
  inherit (inputs) disko;
in {
  imports =
    [disko.nixosModules.disko]
    ++ [
      ./disko-config.nix
    ];

  fileSystems."/nix/persist".neededForBoot = true;
}
