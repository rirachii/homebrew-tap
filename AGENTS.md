# Homebrew tap instructions

- `Casks/converty.rb` is the canonical Homebrew definition for Converty.
- `Casks/chirpberry.rb` is the canonical Chirpberry Mac preview cask. Its release must be public and anonymously downloadable with the pinned checksum before this cask is merged. Install into its separate Electron candidate folder; preserve the native app and user data.
- Pin the exact versioned upstream release URL and SHA-256 checksum.
- Verify release assets and corresponding source exist before updating a cask.
- Declare the real CPU and macOS requirements.
- Keep unnotarized status visible until the release is notarized.
- Use declarative app installation without shell hooks or changes to Gatekeeper or quarantine.
- Preserve user preferences, original files, and converted output during uninstall.
- Run Homebrew style and audit checks, then verify a real installation without overwriting an existing app.
- For local QA, set `HOMEBREW_NO_AUTO_UPDATE=1`, `HOMEBREW_NO_INSTALL_CLEANUP=1`, and `HOMEBREW_NO_ANALYTICS=1`; use a temporary `--appdir` and never adopt or force over an existing app.
- Keep maintenance instructions in the tracked README.

For the explicitly experimental Chirpberry preview, online audit uses `--except=github_prerelease_version` because the published GitHub release intentionally remains a prerelease. Do not expand this exception or relabel the release stable to satisfy audit. All checksum, architecture, installation, signature, and other online checks still apply.
