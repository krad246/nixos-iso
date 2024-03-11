{pkgs, ...}: {
  home = {
    packages = with pkgs;
      [
        uutils-coreutils
        envsubst
      ]
      ++ [
        gnumake
        just
        safe-rm
      ]
      ++ [
        neofetch
        nodePackages.undollar
        duf
      ]
      ++ [comma];
  };
}
