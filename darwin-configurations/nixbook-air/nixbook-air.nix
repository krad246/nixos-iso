{
  ezModules,
  inputs,
  ...
}: let
  inherit (inputs) home-manager;
in {
  imports =
    (with ezModules;
        [darwin homebrew] ++ [arc signal])
    ++ [
      home-manager.darwinModule
      {
        home-manager.useGlobalPkgs = true;
        home-manager.users.krad246 = import ../../home-configurations/krad246.nix;
      }
    ];

  users.users.krad246 = {
    home = "/Users/krad246";
    createHome = true;
  };
}
