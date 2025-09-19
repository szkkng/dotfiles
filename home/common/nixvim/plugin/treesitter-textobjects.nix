{ ... }:
{
  plugins.treesitter-textobjects = {
    enable = true;
    select = {
      enable = true;
      lookahead = true;
      keymaps = {
        "af" = "@function.outer";
        "if" = "@function.inner";
        "ac" = "@class.outer";
        "ic" = "@class.inner";
        "ai" = "@conditional.outer";
        "ii" = "@conditional.inner";
        "al" = "@loop.outer";
        "il" = "@loop.inner";
      };
    };
    swap = {
      enable = true;
      swapNext = {
        "<leader>sn" = "@parameter.inner";
      };
      swapPrevious = {
        "<leader>sp" = "@parameter.inner";
      };
    };
    move = {
      enable = true;
      setJumps = true;
      gotoNextStart = {
        "]f" = "@function.outer";
        "]i" = "@conditional.outer";
        "]l" = "@loop.outer";
      };
      gotoNextEnd = {
        "]F" = "@function.outer";
        "]I" = "@conditional.outer";
        "]L" = "@loop.outer";
      };
      gotoPreviousStart = {
        "[f" = "@function.outer";
        "[i" = "@conditional.outer";
        "[l" = "@loop.outer";
      };
      gotoPreviousEnd = {
        "[F" = "@function.outer";
        "[I" = "@conditional.outer";
        "[L" = "@loop.outer";
      };
    };
  };

}
