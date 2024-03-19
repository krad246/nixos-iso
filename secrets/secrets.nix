let
  krad246 = {
    immutable-gnome = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGKd83MiKefYk702WTPhimblIQGsZKcNDlnhwuYjqDgo";
    nixos-wsl = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOk51a/d6J53YyN4N6Q5gstkup07dPlQzIS/QiBzoMzg";
  };
in {
  "gh.age".publicKeys = with krad246; [immutable-gnome nixos-wsl];
}
