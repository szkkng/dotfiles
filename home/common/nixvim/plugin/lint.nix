{ ... }:
{
  plugins.lint = {
    enable = true;
    lintersByFt = {
      ghaction = [ "actionlint" ];
    };
    autoCmd = {
      event = [
        "BufReadPre"
        "BufNewFile"
        "InsertLeave"
      ];
      group = "lint";
      callback.__raw = ''
        function()
          require ('lint').try_lint()
        end
      '';
    };
  };

  autoGroups = {
    lint = {
      clear = true;
    };
  };
}
