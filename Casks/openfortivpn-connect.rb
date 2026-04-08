cask "openfortivpn-connect" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.1"
  sha256 arm:   "e18a5c281953707c69c759705e46bb49a8b91e9a8214ca395cc9957e0678b566",
         intel: "5f4b45b28bdf0ebb9ae395539fa768e59c9da545571ed26173fc59fd0065637b"

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

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/OpenFortiVpn Connect.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.openfortivpn-connect.desktop",
    "~/Library/Caches/com.openfortivpn-connect.desktop",
    "~/Library/Preferences/com.openfortivpn-connect.desktop.plist",
  ]
end
