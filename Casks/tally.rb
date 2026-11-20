cask "tally" do
  version "1.6"
  sha256 "439b8b0bd2f37c6c3ec473baedf17d55583629e329833db1db7caa7e7505744b"

  url "https://github.com/PratikRai0101/tally/releases/download/v#{version}/Tally.zip"
  name "Tally"
  desc "Menu bar meters for AI coding plan limits, resets and spend"
  homepage "https://tally-site.vercel.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Tally.app"

  # Tally isn't notarized yet. The download is pinned by the sha256 above, so clear
  # the quarantine flag to skip Gatekeeper's "could not verify" prompt.
  postflight_steps do
    if_path_exists "{{appdir}}/Tally.app" do
      run "/usr/bin/xattr",
          args: ["-dr", "com.apple.quarantine", "{{appdir}}/Tally.app"]
    end
  end

  uninstall quit: "local.tally.menubar"

  zap trash: [
    "~/Library/Application Support/Tally",
    "~/Library/Preferences/local.tally.menubar.plist",
  ]
end
