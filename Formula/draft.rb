class Draft < Formula
  desc "Draft is a tool that creates the miminum required files for your Kubernetes deployments."
  homepage "https://github.com/Azure/draft"
  version "0.0.21"
  url "https://github.com/Azure/draft/archive/refs/tags/v0.0.21.tar.gz"
  sha256 "c6ccdd516fb7a35eb90dfee59c694686240da6ed96c12956e06687eb84384508"
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