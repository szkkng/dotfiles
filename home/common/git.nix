{ ... }:
{
  programs.git = {
    enable = true;
    userName = "szkkng";
    userEmail = "hi@kengo.dev";
    ignores = [
      ".direnv"
      ".envrc"
    ];
    aliases = {
      st = "status";
      ci = "commit";
      co = "checkout";
      sw = "switch";
      last = "log - 1";
      logol = "log - -oneline";
    };
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      fetch = {
        prune = "true";
      };
      core = {
        editor = "nvim";
        autocrlf = "input";
        ignorecase = "false";
      };
      pull = {
        ff = "only";
      };
    };
    delta = {
      enable = true;
      options = {
        line-numbers = true;
      };
    };
  };
}
