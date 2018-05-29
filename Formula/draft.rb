class Draft < Formula
  desc "A tool for developers to create cloud-native applications on Kubernetes."
  homepage "https://github.com/Azure/draft"
  version "0.15.0"
  url "https://azuredraft.blob.core.windows.net/draft/draft-v#{version}-darwin-amd64.tar.gz"
  sha256 "c1b3da0d2dd3e86bbd4aa259c91710bdf94f711d37ff98ba4279977c22b90fbe"

  depends_on "kubernetes-helm" => :recommended

  def install
    bin.install name
  end

  test do
    system bin/name, "version", "--client"
  end
end
