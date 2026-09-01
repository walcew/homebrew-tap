cask "openfortivpn-connect" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.9"
  sha256 arm:   "c4ff4df05491011a6f28eef933dbe74a2699a3ef683d5895921ffd0c2acb3d3d",
         intel: "991fbfbed200d5fe628a7161462b54e5451fa025ad9686861a24ebedb4475b62"

  url "https://github.com/walcew/openfortivpn-connect/releases/download/v#{version}/OpenFortiVpn.Connect_#{version}_#{arch}.dmg",
      verified: "github.com/walcew/openfortivpn-connect/"
  name "OpenFortiVpn Connect"
  desc "GUI client for openfortivpn VPN connections"
  homepage "https://github.com/walcew/openfortivpn-connect"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on formula: "openfortivpn"
  depends_on macos: :monterey

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
