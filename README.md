# Homebrew tap for Tally

[Tally](https://github.com/PratikRai0101/tally) is a macOS menu bar app that shows your AI coding plan limits, resets and spend (Claude, Codex, OpenCode).

```bash
brew install --cask pratikrai0101/tally/tally
```

Update with `brew upgrade --cask tally`; remove with `brew uninstall --cask tally` (add `--zap` to also remove its settings).

Tally isn't notarized yet, so the cask clears the quarantine flag after install to skip the "could not verify" prompt. The download is pinned by its SHA-256.

## Releasing

After publishing a new Tally release, update `version` and `sha256` in [`Casks/tally.rb`](Casks/tally.rb):

```bash
shasum -a 256 Tally.zip
```
