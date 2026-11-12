# Template file — not installable as-is. The release workflow rewrites
# version + sha256 in the tap repo (btucker/homebrew-graftty) on each
# publish. See docs/release/README.md for the bootstrap procedure.

cask "graftty" do
  version "0.8.1"
  sha256 "c33b710c42b2ee9f8c892b3998a3603530e9a6662d82539810ab5288f275b1b9"

  url "https://github.com/btucker/graftty/releases/download/v#{version}/Graftty-#{version}.zip"
  name "Graftty"
  desc "Worktree-aware terminal multiplexer"
  homepage "https://github.com/btucker/graftty"

  depends_on macos: ">= :sonoma"

  app "Graftty.app"
  binary "#{appdir}/Graftty.app/Contents/Helpers/graftty"

  zap trash: [
    "~/Library/Application Support/Graftty",
    "~/Library/Preferences/com.graftty.app.plist",
    "~/Library/Caches/com.graftty.app",
  ]

end
