cask "chirpberry" do
  version "0.2.0-preview.1"
  sha256 "2a08e4a9e281947678ff9353da1bc9d10aa4bb2d70aa067c1ab8826b232bf074"

  url "https://github.com/rirachii/chirpberry/releases/download/v#{version}/Chirpberry-0.2.0-arm64.dmg"
  name "Chirpberry"
  desc "Meeting notebook with optional speech transcription and AI questions"
  homepage "https://github.com/rirachii/chirpberry"

  livecheck do
    skip "Experimental preview; update after release verification"
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Chirpberry.app", target: "Chirpberry Electron Candidate/Chirpberry.app"

  caveats <<~EOS
    This experimental preview is not notarized by Apple. macOS may block its first launch.
    If you choose to trust the app, follow Apple's instructions:
      https://support.apple.com/en-us/102445

    Installs in #{appdir}/Chirpberry Electron Candidate/Chirpberry.app.
    Preserve an existing native Chirpberry.app and never replace a running candidate.
    Live service, device, and sustained-meeting performance checks remain open.
    Speech requires your own Valsea key and credits; meeting AI needs a separate OpenAI key.
    Setup and current limits: https://chirpberry.vercel.app/get-started
  EOS
end
