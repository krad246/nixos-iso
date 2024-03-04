{
  ezModules,
  pkgs,
  ...
}: {
  imports = with ezModules;
    [
      ./krad246-cli.nix
    ]
    ++ [discord spotify vscode];

  home.packages = with pkgs; [steam];
}
