cask "vpnconnect" do
  arch arm: "aarch64", intel: "x64"

  version "0.8.2"
  sha256 arm:   "eb96ad6332317471c5b4cc351af8e7a544e73f86f91edf796dbe95f81ad98f95",
         intel: "c62ac17976f1cd75e0059af220cc144f750f5609534b03acdea0fbafb7ea2788"

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
