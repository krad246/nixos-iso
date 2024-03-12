FROM ghcr.io/nixos/nix

RUN echo 'experimental-features = nix-command flakes' >>/etc/nix/nix.conf
RUN nix-env -iA \
  nixpkgs.direnv \
  nixpkgs.nix-direnv
