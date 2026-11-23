cask "vpnconnect" do
  arch arm: "aarch64", intel: "x64"

  version "0.7.0"
  sha256 arm:   "e0933d76055e8e705aa2e56cc3e2b9014f26671b0487fc7aa4545729b0d985a2",
         intel: "0fa9990b0cae5e68b3ba00003a4b245e3de86bde7c0c94d765ee9c4f26923585"

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
