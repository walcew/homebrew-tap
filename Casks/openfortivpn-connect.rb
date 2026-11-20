cask "openfortivpn-connect" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.0"
  sha256 arm:   "aac7b524beb41b19c92f2ff5b33d23c590ffd4e4bbdef67285705dff49fdf701",
         intel: "a755256233ea84c409ffec2bd5e1aeec45f41e7d31b37c465e5c51acfe770824"

  url "https://github.com/walcew/openfortivpn-connect/releases/download/v#{version}/OpenFortiVpn.Connect_#{version}_#{arch}.dmg",
      verified: "github.com/walcew/openfortivpn-connect/"
  name "OpenFortiVpn Connect"
  desc "GUI client for openfortivpn VPN connections"
  homepage "https://github.com/walcew/openfortivpn-connect"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "OpenFortiVpn Connect.app"
  binary "#{appdir}/OpenFortiVpn Connect.app/Contents/MacOS/openvpngui", target: "vpnconnect"

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
