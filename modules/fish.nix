{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      fish_add_path $HOME/.scripts
      fish_add_path $HOME/.ghcup/bin
    '';
    shellInitLast = ''
      starship init fish | source
      set -gx VOLTA_HOME "$HOME/.volta"
      set -gx PATH "$VOLTA_HOME/bin" $PATH
    '';
    plugins = [
      {
        name = "z";
        src = pkgs.fishPlugins.z.src;
      }
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
    ];
    shellAliases = {
      ls = "eza";
      ll = "eza -l --git";
      vi = "nvim";
      sed = "gsed";
    };
    functions = {
      # https://github.com/oh-my-fish/plugin-peco/blob/master/functions/peco_select_history.fish
      peco_select_history = ''
        if test (count $argv) = 0
         set peco_flags --layout=bottom-up
        else
         set peco_flags --layout=bottom-up --query "$argv"
        end

        history|peco $peco_flags|read foo

        if [ $foo ]
          commandline $foo
        else
          commandline ""
        end
      '';
      fish_user_key_bindings = "bind \\cr peco_select_history";
    };
  };
}

