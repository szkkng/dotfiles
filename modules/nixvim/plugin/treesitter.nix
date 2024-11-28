{ pkgs, ... }:
{
  plugins.treesitter = {
    enable = true;
    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      bash
      haskell
      cmake
      cpp
      javascript
      json
      lua
      markdown
      markdown_inline
      nix
      regex
      toml
      typescript
      tsx
      vim
      vimdoc
      xml
      yaml
    ];
    settings = {
      highlight = {
        enable = true;
      };
    };
  };
}
