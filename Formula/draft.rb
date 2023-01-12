
class Draft < Formula
  desc "Draft is a tool that creates the miminum required files for your Kubernetes deployments."
  homepage "https://github.com/Azure/draft"
  version "v0.0.27"
  url "https://github.com/Azure/draft/archive/refs/tags/v0.0.27.tar.gz"
  sha256 "3d8d2cd2343b4e0d69b4f109732349daba65300e74a98c7a63729ea84bef0e25"
  license "MIT"

  depends_on "go" => [:build,"1.18"]

  def install
    ENV.deparallelize
    system "make", "all"
    system "mkdir","#{prefix}/bin"
    system "cp", "draft", "#{prefix}/bin/draft"
  end

  test do
    system  "#{bin}/draft", "-v"
  end
end

