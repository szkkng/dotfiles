{ pkgs, inputs, ... }:
{
  imports = [
    ./home-manager.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "aarch64-darwin";

  nix = {
    gc = {
      automatic = true;
      options = "--delete-older-than 1w";
    };
    optimise.automatic = true;
    settings.experimental-features = "nix-command flakes";
  };

  system.stateVersion = 5;
  system.configurationRevision = inputs.rev or inputs.dirtyRev or null;
  security.pam.services.sudo_local.touchIdAuth = true;

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
      "brave-browser"
      "chatgpt"
      "cycling74-max"
      "deepl"
      "discord"
      "font-jetbrains-mono"
      "font-jetbrains-mono-nerd-font"
      "karabiner-elements"
      "keycastr"
      "obsidian"
      "reaper"
      "raycast"
      "spotify"
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
      location = "~/Screenshots";
    };
    NSGlobalDomain = {
      _HIHideMenuBar = true;
    };
    ".GlobalPreferences" = {
      "com.apple.mouse.scaling" = 2.0;
    };
  };

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToControl = true;
  };

  system.activationScripts.postUserActivation.text = ''
    mkdir -p "$HOME/Screenshots"
  '';
}
