{ ... }:
{
  programs.aerc = {
    enable = true;
    extraConfig = {
      ui = {
        spinner = ''
          [ ⡿ ],[ ⣟ ],[ ⣯ ],[ ⣷ ],[ ⣾ ],[ ⣽ ],[ ⣻ ],[ ⢿ ]
        '';
      };
      filters = {
        "text/plain" = "colorize";
        "text/html" = "html | colorize";
      };
    };
  };
}
