{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      fish_add_path $HOME/.scripts
      fish_add_path $HOME/.ghcup/bin
      fish_add_path /opt/homebrew/bin
      fish_add_path -p ~/.nix-profile/bin /nix/var/nix/profiles/default/bin /run/current-system/sw/bin
    '';
    shellInitLast = ''
      set -gx VOLTA_HOME "$HOME/.volta"
      set -gx PATH "$VOLTA_HOME/bin" $PATH
    '';
    plugins = [
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
      {
        name = "fzf";
        src = pkgs.fishPlugins.fzf.src;
      }
    ];
    shellAliases = {
      vi = "nvim";
      sed = "gsed";
    };
  };
}

