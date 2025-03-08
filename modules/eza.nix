{ ... }:
{
  programs.eza = {
    enable = true;
    icons = "auto";
    git = true;
    extraOptions = [
      "--group-directories-first"
    ];
  };

  home.shellAliases = {
    ls = "eza";
    ll = "eza -l";
    la = "eza -la";
    tree = "eza -T";
  };
}
