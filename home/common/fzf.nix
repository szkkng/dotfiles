{ ... }:
{
  programs.fzf = {
    enable = true;
    fileWidgetOptions = [
      "--walker-skip .git,node_modules,target"
      "--preview 'bat -n --color=always {}'"
    ];
  };
}
