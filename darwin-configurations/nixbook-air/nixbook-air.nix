{ezModules, ...}: let
  darwinModules = ezModules;
in {
  imports = with darwinModules; ([darwin homebrew] ++ [arc signal] ++ [vmware]);

  users.users.krad246 = {
    home = "/Users/krad246";
    createHome = true;
  };

  homebrew.casks = ["docker" "bluesnooze"];
}
