{
  programs.git = {
    enable = true;
    userName = "szkkng";
    userEmail = "hi@kengo.dev";
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
        # catppuccin-mocha
        # https://github.com/catppuccin/delta/blob/main/catppuccin.gitconfig
        blame-palette = "#1e1e2e #181825 #11111b #313244 #45475a";
        commit-decoration-style = "box ul";
        dark = true;
        file-decoration-style = "#cdd6f4";
        file-style = "#cdd6f4";
        hunk-header-decoration-style = "box ul";
        hunk-header-file-style = "bold";
        hunk-header-line-number-style = "bold #a6adc8";
        hunk-header-style = "file line-number syntax";
        line-numbers-left-style = "#6c7086";
        line-numbers-minus-style = "bold #f38ba8";
        line-numbers-plus-style = "bold #a6e3a1";
        line-numbers-right-style = "#6c7086";
        line-numbers-zero-style = "#6c7086";
        minus-emph-style = "bold syntax #53394c";
        minus-style = "syntax #34293a";
        plus-emph-style = "bold syntax #404f4a";
        plus-style = "syntax #2c3239";
        map-styles = ''
          bold purple => syntax #494060,
          bold blue => syntax #384361,
          bold cyan => syntax #384d5d,
          bold yellow => syntax #544f4e
        '';
        # Should match the name of the bat theme
        syntax-theme = "catppuccin-mocha";
      };
    };
  };
}

