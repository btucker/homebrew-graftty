# Template file — not installable as-is. The release workflow rewrites
# version + sha256 in the tap repo (btucker/homebrew-graftty) on each
# publish. See docs/release/README.md for the bootstrap procedure.

cask "graftty" do
  version "0.1.10"
  sha256 "e4a9931607b64b29ad997593f961be67602833aa1bbce1b2269c1313be52ffd3"

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

  caveats <<~EOS
    Graftty is currently ad-hoc signed (not notarized). On first launch,
    macOS will refuse to open it with a Gatekeeper warning. To approve it:

      1. Try to open Graftty from /Applications (it will fail)
      2. Open System Settings → Privacy & Security
      3. Scroll to the "Security" section and click "Open Anyway" next to
         the Graftty message
      4. Confirm in the dialog that appears

    (On macOS 14 Sonoma you can alternatively right-click Graftty in
    Applications and choose "Open".)
  EOS
end
