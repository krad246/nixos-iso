{pkgs, ...}: {
  home = {
    packages = with pkgs;
      [
        uutils-coreutils
        envsubst
        wget
        unzip
        safe-rm
        jq
      ]
      ++ [
        gnumake
        just
        gcc
      ]
      ++ [
        neofetch
        nodePackages.undollar
        duf
      ]
      ++ [comma];
  };
}
