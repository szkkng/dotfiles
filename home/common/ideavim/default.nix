{ config, ... }:
{
  xdg.configFile."ideavim/ideavimrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/home/common/ideavim/config/ideavimrc";
}
