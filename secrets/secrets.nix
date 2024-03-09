let
  nixos = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJo+ccKOMJiBpk0V/GHsS2vddOksdoDtt+JrFazgex1u";
in {
  "gh.age".publicKeys = [nixos];
}
