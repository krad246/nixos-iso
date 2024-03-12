{
  imports =
    [
      ../bash.nix
      ../bat.nix
      ../bottom.nix
      ../coreutils.nix
      ../colima.nix
      ../direnv.nix
      ../git.nix
      ../nerdfonts.nix
      ../nvim
      ../ripgrep.nix
      ../starship.nix
      ../zoxide.nix
      ../zsh.nix
    ]
    ++ [./settings.nix];
}
