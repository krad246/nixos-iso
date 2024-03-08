{
  config,
  pkgs,
  stdenv,
  lib,
  osConfig,
  ...
}: {
  imports = [
    ../home-modules/colima.nix
    ../home-modules/discord.nix
    ../home-modules/kitty.nix
    ../home-modules/nerdfonts.nix
    ../home-modules/shellenv
    ../home-modules/spotify.nix
    ../home-modules/vscode.nix
  ];

  home = {
    username = osConfig.users.users.krad246.name or "krad246";
    stateVersion = lib.trivial.release;
    homeDirectory =
      osConfig.users.users.krad246.home
      or (
        if pkgs.stdenv.isDarwin
        then "/Users/krad246"
        else "/home/krad246"
      );

    sessionVariables = {
      HOME = "${config.home.homeDirectory}";
    };
  };
}
