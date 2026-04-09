cask "openfortivpn-connect" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.5"
  sha256 arm:   "2759052b8a8246679d3feadd2d6fd8e103dfc6e5eccd84e01609387c0be32d2c",
         intel: "a991db3cd85c708f1868764f64ee0538a3518740ad61d67f2f1ea443e7a1a0a9"

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
