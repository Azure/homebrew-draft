class Draft < Formula
  desc "A tool for developers to create cloud-native applications on Kubernetes."
  homepage "https://github.com/Azure/draft"
  version "0.10.0"
  url "https://azuredraft.blob.core.windows.net/draft/draft-v#{version}-darwin-amd64.tar.gz"
  sha256 "5c785924a0ea16a4a2b20300295bf919e0590b279a0685e5e5670c7a0a2f69da"

  depends_on "kubernetes-helm" => :recommended
  conflicts_with 'draft-canary', :because => 'multiple version'

  def install
    bin.install name
  end

  test do
    system bin/name, "version", "--client"
  end
end
