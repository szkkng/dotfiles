{ self, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "aarch64-darwin";
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;
  nix.settings.experimental-features = "nix-command flakes";
  system.stateVersion = 5;
  system.configurationRevision = self.rev or self.dirtyRev or null;
  security.pam.enableSudoTouchIdAuth = true;

  users.users.kengo = {
    name = "kengo";
    home = "/Users/kengo";
  };

  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
    casks = [
      "1password"
      "ableton-live-suite"
      "chatgpt"
      "deepl"
      "font-jetbrains-mono"
      "font-jetbrains-mono-nerd-font"
      "jetbrains-toolbox"
      "cycling74-max"
      "splice"
    ];
    masApps = {
      "Amazon Kindle" = 302584613;
      "LINE" = 539883307;
      "Logic Pro" = 634148309;
      "Magnet" = 441258766;
      "Spark" = 1176895641;
      "Klack" = 6446206067;
    };
  };

  system.defaults = {
    # https://macos-defaults.com/
    dock = {
      autohide = true;
      show-recents = false;
      mineffect = "scale";
      static-only = true;
    };
    finder = {
      AppleShowAllExtensions = true;
      CreateDesktop = false;
      ShowPathbar = true;
      ShowStatusBar = true;
    };
    screencapture = {
      location = "~/screenshots";
    };
    ".GlobalPreferences" = {
      "com.apple.mouse.scaling" = 2.0;
    };
  };
}
