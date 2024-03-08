{
  imports = [
    ../bash.nix
    ../bat.nix
    ../coreutils.nix
    ../direnv.nix
    ../git.nix
    ../nerdfonts.nix
    ../nvim
    ../starship.nix
    ../zsh.nix
  ];

  programs = {
    bottom.enable = true;
    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
  };
}
