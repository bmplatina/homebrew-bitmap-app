cask "bitmap-app" do
  version "1.0.2"
  sha256 "82cb21265188d053683450297679117200924bc9c0da2e63e35395b4be283d1d"

  # GitHub Releases 다운로드 URL
  url "https://github.com/bmplatina/bitmap-v0-nextron/releases/download/v#{version}/Bitmap-#{version}-arm64.dmg",
    verified: "github.com/bmplatina/bitmap-v0-nextron/"
  
  name "Bitmap"
  desc "Digital artists platform Powered by Bitmap Production"
  homepage "https://prodbybitmap.com"

  depends_on arch: :arm64

  # DMG 내부의 어떤 .app 파일을 macOS의 /Applications 폴더로 이동시킬지 지정
  app "Bitmap.app"

  postflight do
    system_command "xattr",
                   args: ["-c", "#{appdir}/Bitmap.app"]
  end

  # (선택 사항) 앱 삭제(Uninstall) 시 함께 지워질 설정 파일 및 캐시 경로
  zap trash: [
    "~/Library/Application Support/bitmap",
    "~/Library/Preferences/com.prodbybitmap.esd.plist",
  ]
end
