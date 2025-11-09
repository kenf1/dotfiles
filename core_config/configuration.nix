{ pkgs, ... }:
let
  user = import ../user.nix;
in
{
  system.primaryUser = user.primaryUser;
  nixpkgs.hostPlatform = "aarch64-darwin";

  system.defaults = {
    dock = {
      orientation = "left";
      mru-spaces = false;
      persistent-apps = [
        "/Applications/Nix Apps/Firefox.app"
        "/Applications/Nix Apps/LocalSend.app"
        "/Applications/ExifCleaner.app"
        "/Applications/GitHub Desktop.app"
        "/Applications/Nix Apps/VSCodium.app"
        "/Applications/Ghostty.app"
        "/System/Applications/System Settings.app"
      ];
    };

    finder = {
      NewWindowTarget = "Home";
      AppleShowAllExtensions = true;
      FXRemoveOldTrashItems = true;
      ShowPathbar = true;
      ShowRemovableMediaOnDesktop = false;
    };

    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      KeyRepeat = 2;
      AppleEnableMouseSwipeNavigateWithScrolls = false;
      AppleEnableSwipeNavigateWithScrolls = false;
      "com.apple.trackpad.trackpadCornerClickBehavior" = 1;
    };

    screencapture.location = "~/Downloads/screenshots";
    loginwindow.GuestEnabled = false;
  };

  nixpkgs.config.allowUnfree = true;

  # Necessary features for flakes
  nix.settings.experimental-features = "nix-command flakes";

  # Alternative shell support
  programs.zsh.enable = true;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = pkgs.lib.mkDefault null;
  system.stateVersion = 6;
}
