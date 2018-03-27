class Draft < Formula
  desc "A tool for developers to create cloud-native applications on Kubernetes."
  homepage "https://github.com/Azure/draft"
  version "0.12.0"
  url "https://azuredraft.blob.core.windows.net/draft/draft-v#{version}-darwin-amd64.tar.gz"
  sha256 "5caa5cc89d81f193615e3ad55f2c08be59052c3309f7c37d0ed0136d54b82228"

  depends_on "kubernetes-helm" => :recommended

  def install
    bin.install name
  end

  test do
    system bin/name, "version", "--client"
  end
end
