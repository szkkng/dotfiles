{ pkgs, ... }:
{
  programs.fish = {
    interactiveShellInit = ''
      fish_add_path /opt/homebrew/bin
      fish_add_path -p ~/.nix-profile/bin /nix/var/nix/profiles/default/bin /run/current-system/sw/bin
    '';
  };
}
