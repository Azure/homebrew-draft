
class Draft < Formula
  desc "Draft is a tool that creates the miminum required files for your Kubernetes deployments."
  homepage "https://github.com/Azure/draft"
  version "v0.0.31"
  url "https://github.com/Azure/draft/archive/refs/tags/v0.0.31.tar.gz"
  sha256 "7285c015b5bc071febada98eabcb52f3015252dbb84ee1ceb782b8710856924a"
  license "MIT"

  depends_on "go" => [:build,"1.18"]

  def install
    ENV.deparallelize
    system "GO11MODULE=on"
    system "make", "go-generate"
    system "make", "vendor"
    system "go", "build","-v","-ldflags","-X github.com/Azure/draft/cmd.VERSION=%s" % [version],"-o","."
    system "mkdir","#{prefix}/bin"
    system "cp", "draft", "#{prefix}/bin/draft"
  end

  test do
    system  "#{bin}/draft", "-v"
  end
end

