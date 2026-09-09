cask "converty" do
  version "0.1.0"
  sha256 "eace4163071139d85bed90ea864c0d219c46c2667ba02cd35c090ede902954a3"

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
