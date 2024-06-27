{
  imports = let
    # replace this with an actual commit id or tag
    commit = "master";
    tarball = builtins.fetchTarball {
      url = "https://github.com/NixOS/nixos-hardware/archive/${commit}.tar.gz";
      # replace this with an actual hash
      sha256 = "1c99hc2mv0f5rjxj97wcypyrpi5i3xmpi3sd2fnw2481jxgqn5h3";
    };
    hardware = "${tarball}";
  in ["${hardware}"];
}
