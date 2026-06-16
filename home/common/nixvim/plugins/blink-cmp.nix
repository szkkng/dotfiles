{ ... }:
{
  plugins.blink-cmp = {
    enable = true;
    settings = {
      cmdline.enabled = false;

      keymap = {
        preset = "enter";
      };

      completion = {
        accept = {
          auto_brackets = {
            enabled = true;
          };
        };
        menu = {
          draw = {
            treesitter = [ "lsp" ];
          };
        };
        documentation = {
          auto_show = true;
          auto_show_delay_ms = 200;
        };
      };

      sources = {
        default = [
          "lsp"
          "path"
          "snippets"
          "buffer"
        ];
      };
    };
  };
}
