class BitmapDisttool < Formula
  desc "Bitmap Distribution Tool for Bitmap Developer"
  version "1.0.2"
  homepage "https://prodbybitmap.com"
  license "BSD-3-Clause"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bmplatina/desync-node/releases/download/v#{version}/bitmap_disttool_v#{version}_darwin_arm64",
        verified: "github.com/bmplatina/desync-node/",
        using: :nounzip
      sha256 "8f46e02492467609515161a11d3cec82b88be324a5a83a2bc61e189f0fc105e0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bmplatina/desync-node/releases/download/v#{version}/bitmap_disttool_v#{version}_linux_amd64",
        verified: "github.com/bmplatina/desync-node/",
        using: :nounzip
      sha256 "944862e42d51f5179e9f429a9b0cea72a0be068f9d2cd3c26d8742bf34fb6adc"
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

    chmod 0755, binary_name
    bin.install binary_name => "bitmap-disttool"
  end

  # test do
  #   # 정상 설치 여부를 검증하기 위한 간단한 명령어 테스트
  #   assert_match "1.0.0", shell_output("#{bin}/my-cli-tool --version")
  # end
end