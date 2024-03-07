args: let
  inputs = args.inputs or {};
  disko = inputs.disko.nixosModules.disko or import ./fetch-disko.nix;
in {
  imports = [disko] ++ [./disko-nvme0n1.nix ./initial-configuration.nix];
}
