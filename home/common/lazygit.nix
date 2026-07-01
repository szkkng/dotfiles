{ ... }:
{
  programs.lazygit = {
    enable = true;
    settings = {
      git = {
        # pagers = [
        #   {
        #     pager = "delta --dark --paging=never";
        #     colorArg = "always";
        #   }
        # ];
      };
      gui = {
        nerdFontsVersion = "3";
        # Kanagawa Paper Ink
        # https://github.com/thesimonho/kanagawa-paper.nvim/blob/ecf19800a2673054c19421d82b766f7641688320/palette_colors.md
        theme = {
          activeBorderColor = [
            "#c4b28a"
            "bold"
          ];
          inactiveBorderColor = [ "#625e5a" ];
          searchingActiveBorderColor = [
            "#938aa9"
            "bold"
          ];
          optionsTextColor = [ "#8ea49e" ];
          selectedLineBgColor = [ "#2a2a37" ];
          cherryPickedCommitFgColor = [ "#393836" ];
          cherryPickedCommitBgColor = [ "#c4746e" ];
          markedBaseCommitFgColor = [ "#393836" ];
          markedBaseCommitBgColor = [ "#c4b28a" ];
          unstagedChangesColor = [ "#c4b28a" ];
          defaultFgColor = [ "#dcd7ba" ];
        };
      };
      keybinding = {
        universal = {
          scrollUpMain = "<up>";
          scrollDownMain = "<down>";
        };
      };
    };
  };

  home.shellAliases = {
    lg = "lazygit";
  };
}
