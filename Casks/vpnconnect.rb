cask "vpnconnect" do
  arch arm: "aarch64", intel: "x64"

  version "0.8.0"
  sha256 arm:   "7bba9691e0075f7a5e40625d6177ee815bce9613474cceefa4ef5434c03b4830",
         intel: "ef5172320f4ccc9e0a3775ba738c3e2df39160464430a8ea7987f7eaac3ba6fb"

  url "https://github.com/walcew/vpnconnect/releases/download/v#{version}/VPN.Connect_#{version}_#{arch}.dmg"
  name "VPN Connect"
  desc "VPN client with a GUI and a CLI"
  homepage "https://github.com/walcew/vpnconnect"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "VPN Connect.app"
  binary "#{appdir}/VPN Connect.app/Contents/MacOS/vpnconnect"

  # App sem assinatura notarizada: tira a quarentena para o Gatekeeper não bloquear.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/VPN Connect.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.openvpngui.app",
    "~/Library/Caches/com.openfortivpn-connect.desktop",
    "~/Library/Preferences/com.openfortivpn-connect.desktop.plist",
    "~/Library/WebKit/com.openfortivpn-connect.desktop",
    "~/Library/WebKit/com.openvpngui.app",
    "~/Library/WebKit/openvpngui",
    "~/Library/WebKit/vpnconnect",
  ]
end
