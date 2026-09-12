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

## Main branch protection

Enabled September 12, 2026 at the owner's request. GitHub's active [Protect main ruleset](https://github.com/rirachii/homebrew-tap/rules/23016477), ID `23016477`, targets exactly `refs/heads/main`. Its intended configuration is tracked in [`.github/rulesets/main.json`](.github/rulesets/main.json); GitHub settings enforce it, not the presence of this file.

- Changes must go through a pull request.
- Both `converty` and `chirpberry` checks must pass and come from the GitHub Actions integration (ID `15368`).
- Pull requests must be up to date with `main`, with all review conversations resolved. New changes dismiss prior approvals.
- Force pushes and deletion are blocked, with no administrator or automation bypass actors.
- Existing merge, squash, and rebase methods remain available.

Approving-review count is zero because `rirachii` is currently the only collaborator. Pull requests and CI remain mandatory without requiring a second person's approval. Revisit the review count when another maintainer joins; do not add bypasses to work around failing checks.

Both jobs in `.github/workflows/cask.yml` run on every pull request without path filters. The `converty` job checks style and metadata, installs the public app on a disposable runner, verifies its deep signature and bundled FFmpeg presence, and uninstalls it. The `chirpberry` job checks style and metadata on pull requests; its online audit and installation verification still require a separate workflow dispatch. Passing PR checks does not replace the published-asset, source, checksum, or actual release acceptance requirements above and below.

Keep this shared tap separate from the application repositories: it holds installer definitions for both Converty and Chirpberry, while each app retains its source and releases upstream. Converty and this tap use the same protection policy with repository-specific CI check names. Their settings are independent and do not automatically synchronize.

After creation, the API reported `main.protected = true`, all four rules applied to `main`, and no rules applied to an unrelated branch name. The settings update left the `main` commit unchanged. The live settings matched the tracked configuration, including required checks, trusted integration, strict policy, zero required approvals, and empty bypass list. No force push or deletion was attempted against the live branch.

Read the live configuration before changing it:

```sh
gh api repos/rirachii/homebrew-tap/rulesets/23016477
gh api repos/rirachii/homebrew-tap/rules/branches/main
gh api repos/rirachii/homebrew-tap/branches/main --jq '{name, protected}'
```

Keep this section and the JSON aligned with approved settings changes. Coordinate required check names and triggers with ruleset changes so passing, up-to-date PRs can still merge. Editing the JSON alone does not update GitHub.

## Chirpberry experimental preview

Install [Chirpberry 0.2.0-preview.1](https://github.com/rirachii/chirpberry/releases/tag/v0.2.0-preview.1), an experimental meeting notebook for Mac:

```sh
brew install --cask rirachii/tap/chirpberry
```

Requires Apple Silicon and macOS 26+. The cask pins the exact DMG checksum and installs `Chirpberry.app` into `Applications/Chirpberry Electron Candidate/`. It preserves the separate native app, notes, and preferences. Homebrew refuses an occupied target without an override; do not force or adopt over a running app.

The preview is ad-hoc signed and not notarized. Live-service, clean-user permissions, real Calendar/call detection, and sustained-meeting performance remain under verification. Read the [release checklist](https://github.com/rirachii/chirpberry/blob/main/docs/release-readiness.md). No launch, privileged install, quarantine changes, background services, or user-data cleanup hooks are included.

For each update, verify public release/source URLs and the downloaded SHA-256, then run `brew style Casks/chirpberry.rb`, `brew audit --online --except=github_prerelease_version --cask rirachii/tap/chirpberry`, and a disposable install/uninstall. The Chirpberry CI job checks metadata on PRs; its actual public-download/install step runs only via workflow dispatch after assets are public. Converty's cask and checks are unchanged.

### Preview verification on September 12, 2026

Homebrew style and basic cask audit passed. The authenticated GitHub draft DMG was downloaded and matched SHA-256 `2a08e4a9e281947678ff9353da1bc9d10aa4bb2d70aa067c1ab8826b232bf074`. That exact download was placed in Homebrew's checksum-validated cache for the unpublished URL. A temporary local QA tap installed the cask into a temporary application directory; the app archive matched the previously tested package, deep signature verification passed, and uninstall removed the temporary app. The existing installed Chirpberry app remained unchanged.

The owner approved experimental publication with the remaining manual acceptance limits disclosed. The exact-source release became public on September 12, 2026 at 04:35:47 UTC. Anonymous source ZIP and checksum downloads returned HTTP 200 and matched their recorded hashes. A fresh macOS CI runner downloaded the public DMG during online audit. The full online audit reported only that the GitHub tag is a prerelease; the updated workflow excludes only `github_prerelease_version`, retaining the intentionally experimental label and all other checks. [Homebrew documents the audit exception option](https://docs.brew.sh/Manpage#audit-options-formulacask-). A subsequent runner exhausted GitHub's anonymous metadata API quota; the online audit now uses the workflow's read-only GitHub token, scoped to that step. Installation receives no token. The corrected [public distribution workflow](https://github.com/rirachii/homebrew-tap/actions/runs/34673634654) passed at `a5705ff`: style, basic audit, online audit with the single documented prerelease exception, actual cask installation into a disposable app directory, strict deep signature verification, MCP executable presence, and uninstall. The local anonymous DMG download independently matched the pinned hash. Gatekeeper assessment rejected the unnotarized installed preview; an attempted MCP launch exited with signal 9. No quarantined first-launch acceptance is claimed, and no quarantine/Gatekeeper settings were changed. The CI download step checks file presence and signatures without launching an unnotarized helper.

The initial local install omitted `HOMEBREW_NO_INSTALL_CLEANUP`, so Homebrew started its automatic cleanup of old package versions and caches. It was interrupted; active `opt` links and `brew missing` subsequently showed no broken links or missing dependencies. All remaining commands disable cleanup. Future local QA must use the environment settings in AGENTS.md.
