# Homebrew tap instructions

- `Casks/converty.rb` is the canonical Homebrew definition for Converty.
- Pin the exact versioned upstream release URL and SHA-256 checksum.
- Verify release assets and corresponding source exist before updating a cask.
- Declare the real CPU and macOS requirements.
- Keep unnotarized status visible until the release is notarized.
- Use declarative app installation without shell hooks or changes to Gatekeeper or quarantine.
- Preserve user preferences, original files, and converted output during uninstall.
- Run Homebrew style and audit checks, then verify a real installation without overwriting an existing app.
- Keep maintenance instructions in the tracked README.
