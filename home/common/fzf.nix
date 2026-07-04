{ ... }:
{
  programs.fzf = {
    enable = true;
    defaultOptions = [
      "--height=40%"
      # Kanagawa Paper Ink
      # https://github.com/thesimonho/kanagawa-paper.nvim/blob/ecf19800a2673054c19421d82b766f7641688320/palette_colors.md
      "--color=bg:-1,bg+:#2A2A37,fg:-1,fg+:#DCD7BA,hl:#938AA9,hl+:#c4746e"
      "--color=header:#b6927b,info:#658594,pointer:#7AA89F"
      "--color=marker:#7AA89F,prompt:#c4746e,spinner:#8ea49e"
    ];
    fileWidget.options = [
      "--walker-skip .git,node_modules,target"
      "--preview 'bat -n --color=always {}'"
    ];
  };
}
