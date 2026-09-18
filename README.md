# Myko's Homebrew tap

Converty cask has been withdrawn while the app is sold through Stripe.

## Main branch protection

Enabled September 12, 2026 at the owner's request. GitHub's active [Protect main ruleset](https://github.com/rirachii/homebrew-tap/rules/23016477), ID `23016477`, targets exactly `refs/heads/main`. Its intended configuration is tracked in [`.github/rulesets/main.json`](.github/rulesets/main.json); GitHub settings enforce it, not the presence of this file.

- Changes must go through a pull request.
- Active cask checks must pass and come from the GitHub Actions integration (ID `15368`).
- Pull requests must be up to date with `main`, with all review conversations resolved. New changes dismiss prior approvals.
- Force pushes and deletion are blocked, with no administrator or automation bypass actors.
- Existing merge, squash, and rebase methods remain available.

Approving-review count is zero because `rirachii` is currently the only collaborator. Pull requests and CI remain mandatory without requiring a second person's approval. Revisit the review count when another maintainer joins; do not add bypasses to work around failing checks.

The jobs in `.github/workflows/cask.yml` run on every pull request without path filters. The Chirpberry job checks style and metadata on pull requests; its online audit and installation verification still require a separate workflow dispatch. Passing PR checks does not replace the published-asset, source, checksum, or actual release acceptance requirements above and below.

Keep this shared tap separate from the application repositories: it holds installer definitions while each app retains its source and releases upstream.

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

For each update, verify public release/source URLs and the downloaded SHA-256, then run `brew style Casks/chirpberry.rb`, `brew audit --online --except=github_prerelease_version --cask rirachii/tap/chirpberry`, and a disposable install/uninstall. The Chirpberry CI job checks metadata on PRs; its actual public-download/install step runs only via workflow dispatch after assets are public.

### Preview verification on September 12, 2026

Homebrew style and basic cask audit passed. The authenticated GitHub draft DMG was downloaded and matched SHA-256 `2a08e4a9e281947678ff9353da1bc9d10aa4bb2d70aa067c1ab8826b232bf074`. That exact download was placed in Homebrew's checksum-validated cache for the unpublished URL. A temporary local QA tap installed the cask into a temporary application directory; the app archive matched the previously tested package, deep signature verification passed, and uninstall removed the temporary app. The existing installed Chirpberry app remained unchanged.

The owner approved experimental publication with the remaining manual acceptance limits disclosed. The exact-source release became public on September 12, 2026 at 04:35:47 UTC. Anonymous source ZIP and checksum downloads returned HTTP 200 and matched their recorded hashes. A fresh macOS CI runner downloaded the public DMG during online audit. The full online audit reported only that the GitHub tag is a prerelease; the updated workflow excludes only `github_prerelease_version`, retaining the intentionally experimental label and all other checks. [Homebrew documents the audit exception option](https://docs.brew.sh/Manpage#audit-options-formulacask-). A subsequent runner exhausted GitHub's anonymous metadata API quota; the online audit now uses the workflow's read-only GitHub token, scoped to that step. Installation receives no token. The corrected [public distribution workflow](https://github.com/rirachii/homebrew-tap/actions/runs/34673634654) passed at `a5705ff`: style, basic audit, online audit with the single documented prerelease exception, actual cask installation into a disposable app directory, strict deep signature verification, MCP executable presence, and uninstall. The local anonymous DMG download independently matched the pinned hash. Gatekeeper assessment rejected the unnotarized installed preview; an attempted MCP launch exited with signal 9. No quarantined first-launch acceptance is claimed, and no quarantine/Gatekeeper settings were changed. The CI download step checks file presence and signatures without launching an unnotarized helper.

The initial local install omitted `HOMEBREW_NO_INSTALL_CLEANUP`, so Homebrew started its automatic cleanup of old package versions and caches. It was interrupted; active `opt` links and `brew missing` subsequently showed no broken links or missing dependencies. All remaining commands disable cleanup. Future local QA must use the environment settings in AGENTS.md.
