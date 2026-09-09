cask "converty" do
  version "0.1.1"
  sha256 "a369f89e3255dcb39e362d6f0b890654e1ee170d3568e1e2b373d0c83ed06cc8"

  url "https://github.com/rirachii/converty/releases/download/v#{version}/Converty-#{version}-macOS-arm64.dmg"
  name "Converty"
  desc "Local file conversion and editing utility"
  homepage "https://github.com/rirachii/converty"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Converty.app"

  caveats <<~EOS
    This early release is not notarized by Apple. macOS may block its first launch.
    If you choose to trust the app, follow Apple's instructions:
      https://support.apple.com/en-us/102445
  EOS
end
