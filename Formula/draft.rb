class Draft < Formula
  desc "A tool for developers to create cloud-native applications on Kubernetes."
  homepage "https://github.com/Azure/draft"
  version "0.16.0"
  url "https://azuredraft.blob.core.windows.net/draft/draft-v#{version}-darwin-amd64.tar.gz"
  sha256 "e7a7c8c0d0d2921a6136740dae7803ef79ce25a7f79b3bcde5bbe5f54d2e74d4"

  depends_on "kubernetes-helm" => :recommended

  def install
    bin.install name
  end

  test do
    system bin/name, "version", "--client"
  end
end
