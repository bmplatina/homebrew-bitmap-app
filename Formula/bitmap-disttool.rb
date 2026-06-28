class BitmapDisttool < Formula
  desc "Bitmap Distribution Tool for Bitmap Developer"
  version "1.0.1"
  homepage "https://prodbybitmap.com"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/bmplatina/desync-node/releases/download/v#{version}/bitmap_disttool_v#{version}_darwin_arm64",
        verified: "github.com/bmplatina/desync-node/",
        using: :nounzip
      sha256 "b77f2c9c5389a2bb75c6bd40334643eb458616e5f2cff120e3c760312f47a049"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bmplatina/desync-node/releases/download/v#{version}/bitmap_disttool_v#{version}_linux_amd64",
        verified: "github.com/bmplatina/desync-node/",
        using: :nounzip
      sha256 "d8b02443802be7b5c6b9ebe2a8bd3f7d09a5ccdcce41f3bffecf09ecd11d561e"
    end
  end

  def install
    # 지원하지 않는 환경(macOS Intel, Linux ARM 등)일 경우 설치 중단
    if OS.mac? && Hardware::CPU.intel?
      odie "bitmap-disttool does not support Intel macOS. Apple Silicon (ARM64) is required."
    elsif OS.linux? && !Hardware::CPU.intel?
      odie "bitmap-disttool only supports AMD64 (x86_64) on Linux."
    elsif !OS.mac? && !OS.linux?
      odie "bitmap-disttool is only supported on macOS and Linux."
    end

    # 플랫폼에 따른 바이너리 이름 결정
    binary_name = if OS.mac?
      "bitmap_disttool_v#{version}_darwin_arm64"
    else
      "bitmap_disttool_v#{version}_linux_amd64"
    end

    bin.install binary_name => "bitmap-disttool"
  end

  # test do
  #   # 정상 설치 여부를 검증하기 위한 간단한 명령어 테스트
  #   assert_match "1.0.0", shell_output("#{bin}/my-cli-tool --version")
  # end
end