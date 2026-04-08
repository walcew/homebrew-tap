cask "openfortivpn-connect" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.2"
  sha256 arm:   "95b1fd02cdd2372319d971490a1fe617076b4a96d1e0bd94b161b066f274030d",
         intel: "0f8e9631eea53d4e07881f92ec0ec632f6c1965c4a00069a63a7940457d10e4e"

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
