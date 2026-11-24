cask "vpnconnect" do
  arch arm: "aarch64", intel: "x64"

  version "0.8.1"
  sha256 arm:   "2743d46c12e2968f6401ea29b3360aa101600b31d1917f4ba4df4edc3a7ee427",
         intel: "74dafa505fac03dcd754b9861ef54c48b1d52be501788eed890a3e739d65689a"

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
