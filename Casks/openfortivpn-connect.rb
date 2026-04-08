cask "openfortivpn-connect" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "PLACEHOLDER_ARM64_SHA256",
         intel: "PLACEHOLDER_X64_SHA256"

  url "https://github.com/walcew/openfortivpn-connect/releases/download/v#{version}/OpenFortiVpn.Connect_#{version}_#{arch}.dmg",
      verified: "github.com/walcew/openfortivpn-connect/"
  name "OpenFortiVpn Connect"
  desc "macOS GUI client for openfortivpn VPN connections"
  homepage "https://github.com/walcew/openfortivpn-connect"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on formula: "openfortivpn"
  depends_on macos: ">= :monterey"

  app "OpenFortiVpn Connect.app"

  zap trash: [
    "~/Library/Application Support/com.openfortivpn-connect.desktop",
    "~/Library/Caches/com.openfortivpn-connect.desktop",
    "~/Library/Preferences/com.openfortivpn-connect.desktop.plist",
  ]
end
