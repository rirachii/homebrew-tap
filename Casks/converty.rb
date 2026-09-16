cask "converty" do
  version "0.1.2"
  sha256 "91427c7f5b47cae6a56b3a6e8af64420ef565d0ae933a0afd17f9d97d2b35cf9"

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
