{ ... }:
{
  programs.lazygit = {
    enable = true;
    settings = {
      git = {
        pagers = [
          {
            pager = "delta --dark --paging=never";
            colorArg = "always";
          }
        ];
      };
      gui = {
        nerdFontsVersion = "3";
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
