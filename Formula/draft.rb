class Draft < Formula
  desc "A tool for developers to create cloud-native applications on Kubernetes."
  homepage "https://github.com/Azure/draft"
  version "0.9.0"
  url "https://azuredraft.blob.core.windows.net/draft/draft-v#{version}-darwin-amd64.tar.gz"
  sha256 "6735a5c739f02bb1be314d124c0f55a9dd4c5721b62a76d77b16563ddc700cbd"

  depends_on "kubernetes-helm" => :recommended
  conflicts_with 'draft-canary', :because => 'multiple version'

  def install
    bin.install name
  end

  test do
    system bin/name, "version", "--client"
  end
end
