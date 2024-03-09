{
  inputs,
  ezModules,
  ...
}: let
  inherit (inputs) disko impermanence;
in {
  imports =
    [disko.nixosModules.disko]
    ++ [
      ./disko-config.nix
    ]
    ++ [impermanence.nixosModules.impermanence ezModules.impermanence];

  fileSystems."/nix/persist".neededForBoot = true;
}
