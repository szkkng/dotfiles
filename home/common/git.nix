{ ... }:
{
  programs.git = {
    enable = true;
    ignores = [
      ".direnv"
      ".envrc"
    ];
    settings = {
      user = {
        name = "szkkng";
        email = "hi@kengo.dev";
      };
      alias = {
        st = "status";
        ci = "commit";
        co = "checkout";
        sw = "switch";
        last = "log -1";
        logol = "log --oneline";
      };
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
  };
}
