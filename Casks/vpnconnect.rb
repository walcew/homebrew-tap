cask "vpnconnect" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.0"
  sha256 arm:   "b04ac6c7760414813e64a2407e68ab0b20e01782f46247104ff7d833c57ce9e7",
         intel: "2984fd9c7ef31ed03f475c57d0cedaacd2200eb8697215abb0b8c882800c9707"

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
