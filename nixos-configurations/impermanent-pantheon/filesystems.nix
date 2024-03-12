{
  inputs,
  ezModules,
  ...
}: let
  nixosModules = ezModules;
  inherit (inputs) disko;
in {
  imports =
    [
      disko.nixosModules.disko
      ./disko-config.nix
    ]
    ++ [nixosModules.impermanence];

  fileSystems."/nix/persist".neededForBoot = true;
}
