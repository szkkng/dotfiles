{ ... }:
{
  programs.lazygit = {
    enable = true;
    settings = {
      git = {
        paging = {
          colorArg = "always";
          pager = "delta --dark --paging=never";
        };
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
}
