{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
    plugins = [
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
      {
        name = "fzf";
        src = pkgs.fishPlugins.fzf.src;
      }
    ];
    shellAbbrs = {
      zb = "zig build";
      zbr = "zig build run";
    };
  };
}
