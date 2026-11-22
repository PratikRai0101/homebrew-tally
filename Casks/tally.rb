cask "tally" do
  version "1.8"
  sha256 "9c3ddcd8f153c24431956b368e18122f3d715d7149fbb5adcc113ea832d453eb"

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
