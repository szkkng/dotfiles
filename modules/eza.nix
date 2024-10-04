{
  programs.eza = {
    enable = true;
    icons = true;
    git = true;
    extraOptions = [
      "--group-directories-first"
    ];
  };

  programs.fish.shellAliases = {
    ls = "eza";
    ll = "eza -l";
    la = "eza -la";
    tree = "eza -T";
  };
}

