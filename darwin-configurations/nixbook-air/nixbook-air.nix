{darwinModules, ...}: {
  imports = with darwinModules;
    [darwin homebrew] ++ [arc signal];

  users.users.krad246 = {
    home = "/Users/krad246";
    createHome = true;
  };
}
