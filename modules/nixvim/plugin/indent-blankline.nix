{ ... }:
{
  plugins.indent-blankline = {
    enable = true;
    settings = {
      indent = {
        char = "│";
        tab_char = "│";
      };
      scope = {
        show_end = false;
        show_start = false;
      };
    };
  };
}
