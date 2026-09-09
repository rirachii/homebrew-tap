# Myko's Homebrew tap

Install [Converty](https://github.com/rirachii/converty), a native Mac utility for converting and editing files locally:

```sh
brew install --cask rirachii/tap/converty
```

This installs `Converty.app` in Applications using the same checksum-verified DMG offered on GitHub Releases.
The media engine is included; there are no extra codec packages to install.
Requires Apple Silicon and macOS 14 or later.
The early release is not notarized by Apple, and macOS may block its first launch.
If you choose to trust it, follow [Apple's instructions](https://support.apple.com/en-us/102445).
The cask preserves macOS's normal security checks.

## Update or uninstall

When a new cask version is published:

```sh
brew update
brew upgrade --cask rirachii/tap/converty
```

To remove the application:

```sh
brew uninstall --cask rirachii/tap/converty
```

Uninstalling does not remove your converted files or preferences.
If you already installed Converty manually in Applications, Homebrew may report an existing app rather than overwrite it.
Quit the app and move that manual application bundle aside before installing with Homebrew.

## Maintain a release

Publish and verify the DMG and corresponding sources in [Converty's releases](https://github.com/rirachii/converty/releases) first.
Follow the application's [release runbook](https://github.com/rirachii/converty/blob/main/docs/macos-release.md).
Update `version` and `sha256` in `Casks/converty.rb` to the exact published DMG.
Keep the architecture, minimum macOS version, and signing caveat aligned with the release.
Run `brew style Casks/converty.rb`, `brew audit --cask rirachii/tap/converty`, and a real install before publishing the cask update.
Use a disposable macOS runner for install and uninstall checks if a local application is already present.

This is the project's own tap, separate from Homebrew's main cask repository.
The tap is GPL-3.0-or-later; bundled software retains its own licenses and accompanying source materials.
