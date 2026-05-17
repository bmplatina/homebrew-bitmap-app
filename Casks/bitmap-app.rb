cask "bitmap-app" do
  version "1.0.0-beta"
  sha256 "d769daa42d6dfb10c16aae9fd556482abc514851d00044da1e6f5dc87fb68831"

  # GitHub Releases 다운로드 URL
  url "https://github.com/bmplatina/bitmap-v0-nextron/releases/download/v#{version}/Bitmap-#{version}-arm64.dmg",
    verified: "github.com/bmplatina/bitmap-v0-nextron/"
  
  name "Bitmap"
  desc "Digital artists platform Powered by Bitmap Production"
  homepage "https://prodbybitmap.com"

  # DMG 내부의 어떤 .app 파일을 macOS의 /Applications 폴더로 이동시킬지 지정
  app "Bitmap.app"

  # (선택 사항) 앱 삭제(Uninstall) 시 함께 지워질 설정 파일 및 캐시 경로
  zap trash: [
    "~/Library/Application Support/bitmap",
    "~/Library/Preferences/com.prodbybitmap.esd.plist",
  ]
end
