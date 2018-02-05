class Draft < Formula
  desc "A tool for developers to create cloud-native applications on Kubernetes."
  homepage "https://github.com/Azure/draft"
  version "0.10.1"
  url "https://azuredraft.blob.core.windows.net/draft/draft-v#{version}-darwin-amd64.tar.gz"
  sha256 "79162e6a133029fbc9c447aae8c3bfdec21390e53d1ae0d74651813849c6b6d5"

  depends_on "kubernetes-helm" => :recommended
  conflicts_with 'draft-canary', :because => 'multiple version'

  def install
    bin.install name
  end

  test do
    system bin/name, "version", "--client"
  end
end
