class Draft < Formula
  desc "Draft is a tool that creates the miminum required files for your Kubernetes deployments."
  homepage "https://github.com/Azure/draft"
  version "v0.0.36"
  url "https://github.com/Azure/draft/archive/refs/tags/v0.0.36.tar.gz"
  sha256 "fbd8ff123dcba60dd4630632016d972161f588eaeb7d1959ec5e3bf201ef28b4"
  license "MIT"

  depends_on "go" => [:build,"1.22"]

  def install
    ENV.deparallelize
    system "GO11MODULE=on"
    system "make", "go-generate"
    system "go", "build","-v","-ldflags","-X github.com/Azure/draft/cmd.VERSION=%s" % [version],"-o","."
    system "mkdir","#{prefix}/bin"
    system "cp", "draft", "#{prefix}/bin/draft"
  end

  test do
    system  "#{bin}/draft", "-v"
  end
end

