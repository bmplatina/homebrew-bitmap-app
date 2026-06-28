class BitmapDisttool < Formula
  desc "Bitmap Distribution Tool for Bitmap Developer"
  version "1.0.1"
  homepage "https://prodbybitmap.com"
  # 유니버설 바이너리 또는 단일 압축 파일 URL
  url "https://github.com/bmplatina/desync-node/releases/download/v#{version}/bitmap_disttool_v#{version}_darwin_arm64",
    verified: "github.com/bmplatina/desync-node/",
    using: :nounzip
  sha256 "b77f2c9c5389a2bb75c6bd40334643eb458616e5f2cff120e3c760312f47a049"
  license "BSD-3-Clause"

  def install
    # 압축 해제 시 나온 실행 바이너리를 Homebrew bin 폴더에 설치합니다.
    # bin.install은 파일을 자동으로 실행 권한(chmod +x)을 부여하여 설치해 줍니다.
    bin.install "bitmap_disttool_v#{version}_darwin_arm64" => "bitmap-disttool"
  end

  # test do
  #   # 정상 설치 여부를 검증하기 위한 간단한 명령어 테스트
  #   assert_match "1.0.0", shell_output("#{bin}/my-cli-tool --version")
  # end
end