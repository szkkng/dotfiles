{ pkgs, ... }:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "hlchunk";
      src = pkgs.fetchFromGitHub {
        owner = "shellRaining";
        repo = "hlchunk.nvim";
        rev = "ba6e2347177fec8ec6af4ae26d11a468c9e0ca72";
        hash = "sha256-Rx5kpjfpiH9i/IvOXx+wEWSO4gdfmXdhULDxbcBJQAY=";
      };
    })
  ];

  extraConfigLua = ''
    require('hlchunk').setup({
      chunk = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    })
  '';
}

